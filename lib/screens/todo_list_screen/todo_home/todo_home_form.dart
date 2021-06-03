import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo/todo.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo/todo_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo/todo_state.dart';

class TodoHomeForm extends StatefulWidget {
  const TodoHomeForm({Key? key}) : super(key: key);

  @override
  _TodoHomeFormState createState() => _TodoHomeFormState();
}

class _TodoHomeFormState extends State<TodoHomeForm> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<TodoListBloc>(context).add(TodoListFetched());
  }

  _logout(BuildContext screenContext, BuildContext arletContext) {
    _hideArlet(arletContext);
    Navigator.of(screenContext).pop();
  }

  _hideArlet(BuildContext arletContext) {
    Navigator.of(arletContext).pop();
  }

  Future<bool> _onBackPress(BuildContext context) async {
    _onShowLogoutWarning(context);
    return false;
  }

  Future<void> _onShowLogoutWarning(BuildContext screenContext) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext arletContext) {
        return _warningDialog(
            "Message",
            "Do you want logout and exit todo list ?",
            "Cancel",
            "OK",
            () => _hideArlet(arletContext),
            () => _logout(screenContext, arletContext));
      },
    );
  }

  AlertDialog _warningDialog(
      String title,
      String content,
      String btnLeftTitle,
      String btnRightTitle,
      VoidCallback onPressLeftBtn,
      VoidCallback onPressRightBtn) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(content),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(btnLeftTitle),
          onPressed: () => onPressLeftBtn(),
        ),
        TextButton(
          child: Text(btnRightTitle),
          onPressed: () => onPressRightBtn(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoListBloc, TodoListState>(
        listener: (context, state) {},
        child: BlocBuilder<TodoListBloc, TodoListState>(
          builder: (context, state) {
            return WillPopScope(
              onWillPop: () => _onBackPress(context),
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                    title: Center(
                      child: Text('Todo Home'),
                    ),
                    automaticallyImplyLeading: false),
                body: Container(),
              ),
            );
          },
        ));
  }
}
