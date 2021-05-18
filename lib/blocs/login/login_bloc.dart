import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/login/login_event.dart';
import 'package:flutter_play_with_bloc/blocs/login/login_state.dart';
import 'package:flutter_play_with_bloc/services/auth_serivce.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginRequest) {
      yield LoginState(isLoginRequest: true, errorLogin: "");

      if (event.username.isEmpty || event.password.isEmpty) {
        add(LoginError(errorMessage: "username and password is not empty"));
        return;
      }

      Api()
          .LoginAPI(username: event.username, password: event.password)
          .then((value) => {
                if (value == "login_success")
                  add(LoginSuccess(userData: value))
                else
                  add(LoginError(errorMessage: value))
              });
    }
    if (event is LoginError) {
      yield LoginState(isLoginRequest: false, errorLogin: event.errorMessage);
    }
    if (event is LoginSuccess) {
      yield LoginState(isLoginRequest: false, errorLogin: "", isLoged: true);
    }
  }
}
