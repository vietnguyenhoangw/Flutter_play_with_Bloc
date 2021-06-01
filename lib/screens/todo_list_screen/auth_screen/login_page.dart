import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/login/login.dart';
import 'package:flutter_play_with_bloc/screens/todo_list_screen/auth_screen/login_form.dart';

class TodoLoginPage extends StatefulWidget {
  TodoLoginPage({Key? key}) : super(key: key);

  @override
  _TodoLoginPageState createState() => _TodoLoginPageState();
}

class _TodoLoginPageState extends State<TodoLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) {
          return LoginBloc();
        },
        child: TodoLoginForm(),
      ),
    );
  }
}
