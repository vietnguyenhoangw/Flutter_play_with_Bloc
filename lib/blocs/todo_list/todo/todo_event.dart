import 'package:equatable/equatable.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class TodoListFetched extends TodoListEvent {
  int skip;

  TodoListFetched({required this.skip});

  @override
  List<Object> get props => [skip];

  @override
  String toString() => 'TodoListFetched { skip: $skip}';
}
