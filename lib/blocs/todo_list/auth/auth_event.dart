import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_play_with_bloc/modals/todo_user.dart';

abstract class AuthTodoEvent extends Equatable {
  const AuthTodoEvent();

  @override
  List<Object> get props => [];
}

class LoginRequest extends AuthTodoEvent {
  final String username;
  final String password;

  const LoginRequest({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];

  @override
  String toString() =>
      'LoginRequest { username: $username} /  password: $password}';
}

class LoginSuccess extends AuthTodoEvent {
  final TodoUser todoUser;

  const LoginSuccess({
    required this.todoUser,
  });

  @override
  List<Object> get props => [todoUser];

  @override
  String toString() => 'LoginError error: $todoUser';
}

class LoginError extends AuthTodoEvent {
  final String errorMessage;

  const LoginError({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'LoginError error: $errorMessage';
}
