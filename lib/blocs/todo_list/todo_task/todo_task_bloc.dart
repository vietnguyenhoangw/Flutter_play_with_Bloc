import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo/todo_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo_task/todo_task.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo_task/todo_task_event.dart';
import 'package:flutter_play_with_bloc/modals/todo_task.dart';
import 'package:flutter_play_with_bloc/services/todo_service.dart';

class TodoTaskBloc extends Bloc<TodoTaskEvent, TodoTaskState> {
  final TodoListBloc todoBloc;

  TodoTaskBloc({required this.todoBloc}) : super(TodoTaskInitialized());

  @override
  Stream<TodoTaskState> mapEventToState(TodoTaskEvent event) async* {
    if (event is AddTaskRequest) {
      yield TodoTaskStateLoading();
      yield await _mapAddTaskRequestToState(event);
      return;
    }
    if (event is DeleteTaskRequest) {
      yield await _mapDeleteTaskRequestToState(event);
    }
    if (event is EditTaskStatusRequest) {
      yield await _mapEditTaskStatusRequestToState(event);
    }
  }

  Future<TodoTaskState> _mapAddTaskRequestToState(AddTaskRequest event) async {
    dynamic response =
        await TodoApi().addTodoAPI(description: event.description);
    if (response.runtimeType == TodoTask) {
      return TodoTaskStateSuccess(response);
    } else {
      return TodoTaskStateFailure(response);
    }
  }

  Future<TodoTaskState> _mapDeleteTaskRequestToState(
      DeleteTaskRequest event) async {
    dynamic response = await TodoApi().deleteTodoAPI(todoTask: event.todoTask);
    if (response.runtimeType == bool && response == true) {
      return DeleteTaskStateSuccess(event.todoTask);
    } else {
      return DeleteTaskStateFailure(response);
    }
  }

  Future<TodoTaskState> _mapEditTaskStatusRequestToState(
      EditTaskStatusRequest event) async {
    dynamic response = await TodoApi()
        .editStatusTodoAPI(todoTask: event.todoTask, value: event.value);
    if (response.runtimeType == TodoTask) {
      return EditTaskStatusStateSuccess(response);
    } else {
      return EditTaskStatusStateFailure("Error");
    }
  }
}
