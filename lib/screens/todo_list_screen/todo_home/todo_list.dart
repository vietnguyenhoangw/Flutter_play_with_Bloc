import 'package:flutter/material.dart';
import 'package:flutter_play_with_bloc/modals/todo_task.dart';

class TodoList extends StatefulWidget {
  final List<dynamic> todoTaskList;
  final ScrollController scrollController;
  final bool isBottomLoading;

  const TodoList(
      {Key? key,
      required this.todoTaskList,
      required this.scrollController,
      required this.isBottomLoading})
      : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> todoList = widget.todoTaskList;

    return ListView.builder(
        controller: widget.scrollController,
        physics: BouncingScrollPhysics(),
        itemCount: widget.todoTaskList.length,
        itemBuilder: (context, index) {
          if (index != widget.todoTaskList.length - 1) {
            return _todoItem(todoList, index);
          } else {
            return Column(
              children: <Widget>[
                _todoItem(todoList, index),
                Visibility(
                    visible: widget.isBottomLoading,
                    child: Expanded(
                      flex: 0,
                      child: CircularProgressIndicator(),
                    ))
              ],
            );
          }
        });
  }

  Container _todoItem(List<dynamic> todoList, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.blue[100]!, spreadRadius: 3),
        ],
      ),
      padding: const EdgeInsets.only(left: 20.0, top: 30.0, bottom: 30.0),
      margin: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              widget.todoTaskList[index].description,
              style: TextStyle(color: Colors.grey[900]!),
            ),
          ),
        ],
      ),
    );
  }
}
