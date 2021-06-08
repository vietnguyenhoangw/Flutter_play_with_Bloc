import 'package:equatable/equatable.dart';
import 'package:flutter_play_with_bloc/modals/todo_task.dart';

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

class AddNewTask extends TodoListEvent {
  final TodoTask todoTask;

  AddNewTask({required this.todoTask});

  @override
  List<Object> get props => [todoTask];

  @override
  String toString() => 'TodoListFetched { skip: $todoTask}';
}
