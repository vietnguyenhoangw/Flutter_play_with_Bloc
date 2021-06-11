import 'package:equatable/equatable.dart';
import 'package:flutter_play_with_bloc/modals/todo_task.dart';

abstract class TodoTaskEvent extends Equatable {
  const TodoTaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskRequest extends TodoTaskEvent {
  final String description;

  const AddTaskRequest({
    required this.description,
  });

  @override
  List<Object> get props => [description];

  @override
  String toString() => 'AddTaskRequest { description: $description}';
}

class DeleteTaskRequest extends TodoTaskEvent {
  final TodoTask todoTask;

  const DeleteTaskRequest({
    required this.todoTask,
  });

  @override
  List<Object> get props => [todoTask];

  @override
  String toString() => 'DeleteTaskRequest { todoTask: $todoTask}';
}
