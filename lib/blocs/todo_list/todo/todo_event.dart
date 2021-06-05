import 'package:equatable/equatable.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class TodoListFetched extends TodoListEvent {
  int skip;

  TodoListFetched({required this.skip});

  @override
  List<Object> get props => [skip];

  @override
  String toString() => 'TodoListFetched { skip: $skip}';
}

class AddTaskRequest extends TodoListEvent {
  final String taskDescription;

  const AddTaskRequest({
    required this.taskDescription,
  });

  @override
  List<Object> get props => [taskDescription];

  @override
  String toString() => 'AddTaskRequest { taskDescription: $taskDescription}}';
}

class AddTaskSuccess extends TodoListEvent {}

class AddTaskFailure extends TodoListEvent {
  final String errorMessage;

  const AddTaskFailure({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'AddTaskFailure { errorMessage: $errorMessage}}';
}
