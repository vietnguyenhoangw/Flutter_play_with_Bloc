import 'package:flutter/material.dart';
import 'package:flutter_play_with_bloc/screens/todo_list_screen/todo_home/todo_home_form.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({Key? key}) : super(key: key);

  @override
  _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TodoHomeForm(),
    );
  }
}
