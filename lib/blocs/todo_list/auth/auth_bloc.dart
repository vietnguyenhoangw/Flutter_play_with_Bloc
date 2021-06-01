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

  Stream<AuthTodoState> _mapLoginRequestToState(LoginRequest event) async* {
    yield AuthTodoStateLoading();

    try {
      TodoApi()
          .todoLoginAPI(username: event.username, password: event.password)
          .then((value) => {
                if (value.runtimeType == TodoUser)
                  add(LoginSuccess(todoUser: value))
                else
                  add(LoginError(errorMessage: value))
              });
    } catch (e) {
      add(LoginError(errorMessage: e.toString()));
    }
  }

  Stream<AuthTodoState> _mapLoginSuccessToState(LoginSuccess event) async* {
    yield AuthTodoStateSuccess(event.todoUser);
  }

  Stream<AuthTodoState> _mapLoginFailureToState(LoginError event) async* {
    yield AuthTodoStateFailure(event.errorMessage);
  }
}
