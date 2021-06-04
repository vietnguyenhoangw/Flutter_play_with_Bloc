import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo/todo.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo/todo_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo/todo_state.dart';
import 'package:flutter_play_with_bloc/screens/todo_list_screen/todo_home/todo_list.dart';

class TodoHomeForm extends StatefulWidget {
  static int todoSkip = 0;

  const TodoHomeForm({Key? key}) : super(key: key);

  @override
  _TodoHomeFormState createState() => _TodoHomeFormState();
}

class _TodoHomeFormState extends State<TodoHomeForm> {
  late ScrollController scrollController;
  bool isFetchingTodoList = false;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController()
      ..addListener(() => _scrollListener());
    BlocProvider.of<TodoListBloc>(context)
        .add(TodoListFetched(skip: TodoHomeForm.todoSkip));
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    TodoHomeForm.todoSkip = 0;
    super.dispose();
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
        listener: (context, state) {
      if (state.status == TodoListStatus.failure ||
          state.status == TodoListStatus.success) {
        setState(() {
          isFetchingTodoList = false;
        });
      }
    }, child: BlocBuilder<TodoListBloc, TodoListState>(
      builder: (context, state) {
        switch (state.status) {
          case TodoListStatus.failure:
            return const Center(child: Text('failed to fetch todo task'));
          case TodoListStatus.success:
            return WillPopScope(
              onWillPop: () => _onBackPress(context),
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                    title: Center(
                      child: Text('Todo Home'),
                    ),
                    automaticallyImplyLeading: false),
                body: Container(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: TodoList(
                      isBottomLoading: false,
                      todoTaskList: state.todos,
                      scrollController: scrollController),
                ),
              ),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      TodoHomeForm.todoSkip = TodoHomeForm.todoSkip + 10;
      BlocProvider.of<TodoListBloc>(context)
          .add(TodoListFetched(skip: TodoHomeForm.todoSkip));
    }
  }
}
