import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/modals/todo_user.dart';
import 'package:flutter_play_with_bloc/services/todo_service.dart';
import 'auth.dart';

class AuthTodoBloc extends Bloc<AuthTodoEvent, AuthTodoState> {
  AuthTodoBloc() : super(AuthTodoState());

  @override
  Stream<AuthTodoState> mapEventToState(AuthTodoEvent event) async* {
    if (event is LoginRequest) {
      yield* _mapLoginRequestToState(event);
    }
    if (event is LoginSuccess) {
      yield* _mapLoginSuccessToState(event);
    }
    if (event is LoginError) {
      yield* _mapLoginFailureToState(event);
    }
  }

  Stream<AuthTodoState> _mapLoginRequestToState(AuthTodoEvent event) async* {
    yield AuthTodoStateLoading();

    final username = event.props[0].toString();
    final password = event.props[1].toString();

    try {
      TodoApi()
          .todoLoginAPI(username: username, password: password)
          .then((value) => {
                if (value.runtimeType == TodoUser)
                  {
                    // TODO: HANDLE LOGIN SUCCESS
                  }
                else
                  {
                    // TODO: HANDLE LOGIN FAILURE
                  }
              });
    } catch (e) {}
  }

  Stream<AuthTodoState> _mapLoginSuccessToState(AuthTodoEvent event) async* {}

  Stream<AuthTodoState> _mapLoginFailureToState(AuthTodoEvent event) async* {}
}
