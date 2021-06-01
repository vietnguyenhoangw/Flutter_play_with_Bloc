import 'package:equatable/equatable.dart';
import 'package:flutter_play_with_bloc/modals/todo_user.dart';

class AuthTodoState extends Equatable {
  const AuthTodoState();

  @override
  List<Object> get props => [];
}

class AuthTodoInitialized extends AuthTodoState {}

// authentication with username and password state
class AuthTodoStateLoading extends AuthTodoState {}

class AuthTodoStateSuccess extends AuthTodoState {
  final TodoUser todoUser;

  AuthTodoStateSuccess(this.todoUser);

  @override
  List<Object> get props => [todoUser];
}

class AuthTodoStateFailure extends AuthTodoState {
  final String authTodoError;

  AuthTodoStateFailure(this.authTodoError);

  @override
  List<Object> get props => [authTodoError];
}
