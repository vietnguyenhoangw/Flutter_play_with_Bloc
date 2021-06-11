import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo/todo.dart';
import 'package:flutter_play_with_bloc/modals/todo_task_list.dart';
import 'package:flutter_play_with_bloc/services/todo_service.dart';

const _todoLimit = 10;

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListState());

  @override
  Stream<TodoListState> mapEventToState(TodoListEvent event) async* {
    if (event is TodoListFetched) {
      yield state.copyWith(isFetching: true);
      yield await _mapTodoFetchedToState(event, state);
    }
    if (event is AddNewTask) {
      yield await _mapAddTaskToState(event);
    }
    if (event is DeleteTask) {
      yield state.copyWith(isFetching: true);
      yield await _mapDeleteTaskToState(event);
    }
  }

  Future<TodoListState> _mapTodoFetchedToState(
      TodoListFetched event, TodoListState state) async {
    if (state.hasReachedMax) return state.copyWith(isFetching: false);
    try {
      final dataResponse = await TodoApi()
          .todoListFetchedAPI(limit: _todoLimit, skip: event.skip);
      if (dataResponse.runtimeType == TodoTaskList) {
        if (state.status == TodoListStatus.initial) {
          return state.copyWith(
            status: TodoListStatus.success,
            todos: dataResponse.todoTaskList,
            hasReachedMax: false,
            isFetching: false,
          );
        }
        final todoResponse = await TodoApi()
            .todoListFetchedAPI(limit: _todoLimit, skip: event.skip);
        if (todoResponse.runtimeType == TodoTaskList) {
          return todoResponse.todoTaskList.isEmpty
              ? state.copyWith(hasReachedMax: true, isFetching: false)
              : state.copyWith(
                  status: TodoListStatus.success,
                  todos: List.of(state.todos)
                    ..addAll(todoResponse.todoTaskList),
                  hasReachedMax: false,
                  isFetching: false);
        } else {
          return state;
        }
      } else {
        return state.copyWith(status: TodoListStatus.failure);
      }
    } on Exception {
      return state.copyWith(status: TodoListStatus.failure);
    }
  }

  Future<TodoListState> _mapAddTaskToState(AddNewTask event) async {
    return state.copyWith(
        todos: List.of(state.todos)..addAll([event.todoTask]));
  }

  Future<TodoListState> _mapDeleteTaskToState(DeleteTask event) async {
    // remove item
    List<dynamic> taskListTmp = state.todos;
    taskListTmp.removeWhere((item) => item.id == event.todoTask.id);

    // add 1 in last index item after remove
    if (state.hasReachedMax) {
      return state.copyWith(todos: taskListTmp, isFetching: false);
    } else {
      final todoResponse = await TodoApi()
          .todoListFetchedAPI(limit: 1, skip: taskListTmp.length);
      if (todoResponse.runtimeType == TodoTaskList) {
        return todoResponse.todoTaskList.isEmpty
            ? state.copyWith(todos: taskListTmp, isFetching: false)
            : state.copyWith(
                status: TodoListStatus.success,
                todos: taskListTmp..addAll(todoResponse.todoTaskList),
                isFetching: false);
      } else {
        return state;
      }
    }
  }
}
