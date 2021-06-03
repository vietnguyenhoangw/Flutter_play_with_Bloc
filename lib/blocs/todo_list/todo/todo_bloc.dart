import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo/todo.dart';
import 'package:flutter_play_with_bloc/services/todo_service.dart';

const _todoLimit = 10;

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListState());

  @override
  Stream<TodoListState> mapEventToState(TodoListEvent event) async* {
    if (event is TodoListFetched) {
      yield await _mapTodoFetchedToState(state);
    }
  }

  Future<TodoListState> _mapTodoFetchedToState(TodoListState state) async {
    if (state.hasReachedMax) return state;
    try {
      dynamic todos =
          await TodoApi().todoListFetchedAPI(limit: _todoLimit, skip: 0);
      if (state.status == TodoListStatus.initial) {
        return state.copyWith(
          status: TodoListStatus.success,
          todos: todos,
          hasReachedMax: false,
        );
      }
      final posts =
          await TodoApi().todoListFetchedAPI(limit: _todoLimit, skip: 0);
      return posts.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: TodoListStatus.success,
              todos: List.of(state.todos)..addAll(posts),
              hasReachedMax: false,
            );
    } on Exception {
      return state.copyWith(status: TodoListStatus.failure);
    }
  }
}
