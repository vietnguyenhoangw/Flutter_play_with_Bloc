import 'package:equatable/equatable.dart';

enum TodoListStatus { initial, success, failure }

class TodoListState extends Equatable {
  final TodoListStatus status;
  final List<dynamic> todos;
  final bool hasReachedMax;
  final bool isFetching;

  const TodoListState({
    this.status = TodoListStatus.initial,
    this.todos = const <dynamic>[],
    this.hasReachedMax = false,
    this.isFetching = false,
  });

  TodoListState copyWith({
    TodoListStatus? status,
    List<dynamic>? todos,
    bool? hasReachedMax,
    bool? isFetching,
  }) {
    return TodoListState(
        status: status ?? this.status,
        todos: todos ?? this.todos,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        isFetching: isFetching ?? this.isFetching);
  }

  @override
  String toString() =>
      '''TodoListState { status: $status, isFetching: $isFetching, hasReachedMax: $hasReachedMax, todos: ${todos.length} }''';

  @override
  List<Object> get props => [status, todos, hasReachedMax, isFetching];
}
