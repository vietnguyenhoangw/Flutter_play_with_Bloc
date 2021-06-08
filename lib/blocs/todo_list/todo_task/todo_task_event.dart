import 'package:equatable/equatable.dart';

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
