import 'package:equatable/equatable.dart';

class AuthTodoState extends Equatable {
  const AuthTodoState();

  @override
  List<Object> get props => [];
}

class AuthTodoInitialized extends AuthTodoState {}

// authentication with username and password state
class AuthTodoStateLoading extends AuthTodoState {}

class AuthTodoStateSuccess extends AuthTodoState {}

class AuthTodoStateFailure extends AuthTodoState {
  final String authTodoError;

  AuthTodoStateFailure(this.authTodoError);

  @override
  List<Object> get props => [authTodoError];
}
