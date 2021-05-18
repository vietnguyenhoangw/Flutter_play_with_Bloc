import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginRequest extends LoginEvent {
  final String username;
  final String password;

  const LoginRequest({
    @required this.username,
    @required this.password,
  });

  @override
  List<Object> get props => [username, password];

  @override
  String toString() =>
      'LoginRequest { username: $username} /  username: $password}';
}

class LoginSuccess extends LoginEvent {
  final String userData;

  const LoginSuccess({
    @required this.userData,
  });

  @override
  List<Object> get props => [userData];

  @override
  String toString() => 'LoginError error: $userData';
}

class LoginError extends LoginEvent {
  final String errorMessage;

  const LoginError({
    @required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'LoginError error: $errorMessage';
}
