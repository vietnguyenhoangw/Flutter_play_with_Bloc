import 'package:equatable/equatable.dart';
import 'package:flutter_play_with_bloc/modals/todo_user.dart';
import 'package:flutter_play_with_bloc/modals/todo_user_rp.dart';

class AuthTodoState extends Equatable {
  const AuthTodoState();

  @override
  List<Object> get props => [];
}

class AuthTodoInitialized extends AuthTodoState {}

// authentication with username and password state
class AuthTodoStateLoading extends AuthTodoState {}

class AuthTodoStateSuccess extends AuthTodoState {
  final TodoUserRP todoUserRP;

  AuthTodoStateSuccess(this.todoUserRP);

  @override
  List<Object> get props => [todoUserRP];
}

class AuthTodoStateFailure extends AuthTodoState {
  final String authTodoError;

  AuthTodoStateFailure(this.authTodoError);

  @override
  List<Object> get props => [authTodoError];
}
