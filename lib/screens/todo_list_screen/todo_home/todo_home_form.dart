import 'package:flutter/material.dart';

class TodoHomeForm extends StatefulWidget {
  const TodoHomeForm({Key? key}) : super(key: key);

  @override
  _TodoHomeFormState createState() => _TodoHomeFormState();
}

class _TodoHomeFormState extends State<TodoHomeForm> {
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
  }
}
