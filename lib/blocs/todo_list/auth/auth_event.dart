import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

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

class LoginSuccess extends AuthTodoEvent {}

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
