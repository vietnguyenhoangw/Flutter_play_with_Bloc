import 'package:equatable/equatable.dart';

enum TodoListStatus { initial, success, failure }

class TodoListState extends Equatable {
  final TodoListStatus status;
  final List<dynamic> todos;
  final bool hasReachedMax;
  final int skip;

  const TodoListState({
    this.status = TodoListStatus.initial,
    this.todos = const <dynamic>[],
    this.hasReachedMax = false,
    this.skip = 0,
  });

  TodoListState copyWith({
    TodoListStatus? status,
    List<dynamic>? todos,
    bool? hasReachedMax,
    int? skip,
  }) {
    return TodoListState(
        status: status ?? this.status,
        todos: todos ?? this.todos,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        skip: skip ?? this.skip);
  }

  @override
  String toString() {
    return '''TodoListState { status: $status, skip: $skip, hasReachedMax: $hasReachedMax, posts: ${todos.length} }''';
  }

  @override
  List<Object> get props => [];
}
