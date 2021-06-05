import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo/todo.dart';
import 'package:flutter_play_with_bloc/screens/todo_list_screen/todo_add/todo_add_form.dart';

class TodoAddTaskPage extends StatefulWidget {
  const TodoAddTaskPage({Key? key}) : super(key: key);

  @override
  _TodoAddTaskPageState createState() => _TodoAddTaskPageState();
}

class _TodoAddTaskPageState extends State<TodoAddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) {
            return TodoListBloc();
          },
          child: TodoAddTaskForm(),
        ));
  }
}
