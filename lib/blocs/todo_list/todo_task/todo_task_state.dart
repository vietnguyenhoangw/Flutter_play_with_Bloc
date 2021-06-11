import 'package:equatable/equatable.dart';
import 'package:flutter_play_with_bloc/modals/todo_task.dart';

class TodoTaskState extends Equatable {
  const TodoTaskState();

  @override
  List<Object> get props => [];
}

class TodoTaskInitialized extends TodoTaskState {}

// authentication with username and password state
class TodoTaskStateLoading extends TodoTaskState {}

class TodoTaskStateSuccess extends TodoTaskState {
  final TodoTask todoTask;

  TodoTaskStateSuccess(this.todoTask);

  @override
  List<Object> get props => [todoTask];
}

class TodoTaskStateFailure extends TodoTaskState {
  final String todoTaskError;

  TodoTaskStateFailure(this.todoTaskError);

  @override
  List<Object> get props => [todoTaskError];
}
