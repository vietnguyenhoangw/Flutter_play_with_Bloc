import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo_task/todo_task.dart';

class TodoAddTaskForm extends StatefulWidget {
  TodoAddTaskForm({Key? key}) : super(key: key);

  @override
  _TodoAddTaskFormState createState() => _TodoAddTaskFormState();
}

class _TodoAddTaskFormState extends State<TodoAddTaskForm> {
  late TextEditingController textEditController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _onPressConfirmBtn() {
    String taskDescription = textEditController.text;
    BlocProvider.of<TodoTaskBloc>(context)
        .add(AddTaskRequest(description: taskDescription));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoTaskBloc, TodoTaskState>(
        listener: (context, state) {
      if (state is TodoTaskStateSuccess) {
        Navigator.pop(context, state.todoTask);
      }
    }, child:
            BlocBuilder<TodoTaskBloc, TodoTaskState>(builder: (context, state) {
      if (state is TodoTaskStateLoading) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Add new task"),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ));
      } else {
        return _buildScreenContent();
      }
    }));
  }

  GestureDetector _buildScreenContent() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add new task"),
        ),
        floatingActionButton: _confirmBtn(),
        body: Container(
            child: Column(
          children: [
            Expanded(
                flex: 0,
                child: Container(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  margin: const EdgeInsets.only(top: 10.0),
                  alignment: Alignment.topCenter,
                  child: TextFormField(
                    maxLines: 5,
                    controller: textEditController,
                    decoration: InputDecoration(
                      hintText: "Task's description",
                    ),
                  ),
                ))
          ],
        )),
      ),
    );
  }

  FloatingActionButton _confirmBtn() {
    return FloatingActionButton(
      heroTag: "0",
      onPressed: () => _onPressConfirmBtn(),
      child: const Icon(Icons.check),
      backgroundColor: Colors.blue,
    );
  }
}
