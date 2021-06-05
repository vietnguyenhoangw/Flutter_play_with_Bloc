import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoAddTaskForm extends StatefulWidget {
  TodoAddTaskForm({Key? key}) : super(key: key);

  @override
  _TodoAddTaskFormState createState() => _TodoAddTaskFormState();
}

class _TodoAddTaskFormState extends State<TodoAddTaskForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add new task"),
        ),
        body: Container(),
      ),
    );
  }
}
