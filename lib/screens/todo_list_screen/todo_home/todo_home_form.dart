import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/Constants/Constatns.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo/todo.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo/todo_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo/todo_state.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo_task/todo_task.dart';
import 'package:flutter_play_with_bloc/modals/todo_task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../screen.dart';

class TodoHomeForm extends StatefulWidget {
  static int todoSkip = 0;

  const TodoHomeForm({Key? key}) : super(key: key);

  @override
  _TodoHomeFormState createState() => _TodoHomeFormState();
}

class _TodoHomeFormState extends State<TodoHomeForm> {
  late ScrollController scrollController;
  late SlidableController slidableController;
  bool isFetchingTodoList = false;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController()
      ..addListener(() => _scrollListener());
    slidableController = new SlidableController();
    BlocProvider.of<TodoListBloc>(context)
        .add(TodoListFetched(skip: TodoHomeForm.todoSkip));
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    TodoHomeForm.todoSkip = 0;
    super.dispose();
  }

  _onPressSecondaryItemBtn(TodoTask todoTask, String type) {
    _hideSnackBar();
    if (type == PressItemTypes().edit) {
      return;
    }
    if (type == PressItemTypes().delete) {
      BlocProvider.of<TodoTaskBloc>(context)
          .add(DeleteTaskRequest(todoTask: todoTask));
    }
  }

  _logout(BuildContext screenContext, BuildContext arletContext) {
    _hideSnackBar();
    _hideArlet(arletContext);
    Navigator.of(screenContext).pop();
  }

  _hideArlet(BuildContext arletContext) {
    Navigator.of(arletContext).pop();
  }

  _onPressAddTask() {
    _hideSnackBar();
    bool hasReachedMax =
        BlocProvider.of<TodoListBloc>(context).state.hasReachedMax;
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return TodoAddTaskPage();
    })).then((value) => {
          if (hasReachedMax && value != null)
            {
              BlocProvider.of<TodoListBloc>(context)
                  .add(AddNewTask(todoTask: value))
            }
        });
  }

  _showSnackBar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }

  _hideSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
    return MultiBlocListener(
        listeners: [
          BlocListener<TodoListBloc, TodoListState>(listener: (context, state) {
            if (state is TodoListState) {
              if (!state.isFetching) {
                setState(() {
                  isFetchingTodoList = false;
                });
              }
            }
          }),
          BlocListener<TodoTaskBloc, TodoTaskState>(listener: (context, state) {
            if (state is DeleteTaskStateFailure) {
              _showSnackBar(state.deleteTaskError, Colors.red[500]!);
            }
            if (state is DeleteTaskStateSuccess) {
              BlocProvider.of<TodoListBloc>(context)
                  .add(DeleteTask(todoTask: state.todoTask));
            }
          })
        ],
        child: BlocBuilder<TodoListBloc, TodoListState>(
          builder: (context, state) {
            switch (state.status) {
              case TodoListStatus.failure:
                return const Center(child: Text('failed to fetch todo task'));
              case TodoListStatus.success:
                return WillPopScope(
                  onWillPop: () => _onBackPress(context),
                  child: Scaffold(
                    floatingActionButton: _addBtn(),
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                        title: Center(
                          child: Text('Todo Home'),
                        ),
                        automaticallyImplyLeading: false),
                    body: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          child: TodoList(
                              onPressSecondaryItemBtn: (todoTask, type) =>
                                  _onPressSecondaryItemBtn(todoTask, type),
                              isNoMoreData:
                                  BlocProvider.of<TodoListBloc>(context)
                                      .state
                                      .hasReachedMax,
                              isBottomLoading: isFetchingTodoList,
                              todoTaskList: state.todos,
                              scrollController: scrollController),
                        ),
                        Positioned(
                          child: Visibility(
                              visible: state.isFetching && !isFetchingTodoList,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              )),
                        )
                      ],
                    ),
                  ),
                );
              default:
                return Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                        title: Center(
                          child: Text('Todo Home'),
                        ),
                        automaticallyImplyLeading: false),
                    body: const Center(child: CircularProgressIndicator()));
            }
          },
        ));
  }

  FloatingActionButton _addBtn() {
    return FloatingActionButton(
      heroTag: "0",
      onPressed: () => _onPressAddTask(),
      child: const Icon(Icons.add),
      backgroundColor: Colors.blue,
    );
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (!isFetchingTodoList) {
        setState(() {
          isFetchingTodoList = true;
        });
        TodoHomeForm.todoSkip = TodoHomeForm.todoSkip + 10;
        BlocProvider.of<TodoListBloc>(context)
            .add(TodoListFetched(skip: TodoHomeForm.todoSkip));
      }
    }
  }
}
