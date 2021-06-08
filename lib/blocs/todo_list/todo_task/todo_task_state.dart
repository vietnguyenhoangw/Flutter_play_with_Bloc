import 'package:equatable/equatable.dart';

class TodoTaskState extends Equatable {
  const TodoTaskState();

  @override
  List<Object> get props => [];
}

class TodoTaskInitialized extends TodoTaskState {}

// authentication with username and password state
class TodoTaskStateLoading extends TodoTaskState {}

class TodoTaskStateSuccess extends TodoTaskState {}

class TodoTaskStateFailure extends TodoTaskState {
  final String todoTaskError;

  TodoTaskStateFailure(this.todoTaskError);

  @override
  List<Object> get props => [todoTaskError];
}
