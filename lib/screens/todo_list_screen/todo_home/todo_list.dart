import 'package:flutter/material.dart';
import 'package:flutter_play_with_bloc/Constants/Constatns.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatefulWidget {
  final List<dynamic> todoTaskList;
  final ScrollController scrollController;
  final bool isBottomLoading;
  final bool isNoMoreData;
  final dynamic onPressSecondaryItemBtn;
  final dynamic onPressCheckBtn;

  const TodoList(
      {Key? key,
      required this.todoTaskList,
      required this.onPressSecondaryItemBtn,
      required this.scrollController,
      required this.isNoMoreData,
      required this.onPressCheckBtn,
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
                _loadingIncator(widget.isBottomLoading),
                _noMoreDataText(widget.isNoMoreData)
              ],
            );
          }
        });
  }

  Slidable _todoItem(List<dynamic> todoList, int index) {
    return Slidable(
      key: Key(todoList[index].id.toString()),
      actionPane: SlidableBehindActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.blue[100]!, spreadRadius: 3),
          ],
        ),
        padding: const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Text(
                    "Task name:",
                    style: TextStyle(
                        color: Colors.grey[900]!, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                    flex: 1,
                    child: Text(
                      todoList[index].description,
                      style: TextStyle(
                          color: Colors.grey[600]!,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Text(
                    "Finish task",
                    style: TextStyle(
                        color: Colors.grey[900]!, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Checkbox(
                        checkColor: Colors.greenAccent,
                        value: todoList[index].completed,
                        onChanged: (bool? value) =>
                            widget.onPressCheckBtn(value, todoList[index]),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
      secondaryActions: <Widget>[
        // _secondaryCustomBtn(
        //   Colors.green[400]!,
        //   new Icon(Icons.edit),
        //   () => widget.onPressSecondaryItemBtn(
        //       widget.todoTaskList[index], PressItemTypes().edit),
        // ),
        _secondaryCustomBtn(
            Colors.red[400]!,
            new Icon(Icons.delete),
            () => widget.onPressSecondaryItemBtn(
                widget.todoTaskList[index], PressItemTypes().delete))
      ],
    );
  }

  Container _secondaryCustomBtn(
      Color csColor, Icon csIcon, VoidCallback onPress) {
    return new Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      color: csColor,
      child: new IconButton(
        icon: csIcon,
        onPressed: onPress,
      ),
    );
  }

  Visibility _loadingIncator(bool visible) {
    return Visibility(
        visible: visible,
        child: Expanded(
          flex: 0,
          child: CircularProgressIndicator(),
        ));
  }

  Visibility _noMoreDataText(bool visible) {
    return Visibility(
        visible: visible,
        child: Container(
          padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
          child: Text(
            "No more data",
            style: TextStyle(color: Colors.grey[700]!, fontSize: 18),
          ),
        ));
  }
}
