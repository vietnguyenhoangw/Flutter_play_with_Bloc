import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLoginRequest;
  final String errorLogin;
  final bool isLoged;

  const LoginState(
      {this.isLoginRequest = false,
      this.errorLogin = "",
      this.isLoged = false});

  @override
  List<Object> get props => [isLoginRequest, errorLogin, isLoged];
}
