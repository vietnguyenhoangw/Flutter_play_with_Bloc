import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/auth/auth.dart';
import 'package:flutter_play_with_bloc/utils/utils.dart';
import 'package:flutter_play_with_bloc/widgets/text_field.dart';

class TodoLoginForm extends StatefulWidget {
  TodoLoginForm({Key? key}) : super(key: key);

  @override
  _TodoLoginFormState createState() => _TodoLoginFormState();
}

class _TodoLoginFormState extends State<TodoLoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isShowPassWord = false;

  _validationData() {
    if (StringUtil.isNullOrEmpty(_usernameController.text) ||
        StringUtil.isNullOrEmpty(_passwordController.text)) {
      return "Missing required fields";
    }
    return "";
  }

  _onPressShowPassword() {
    setState(() {
      _isShowPassWord = !_isShowPassWord;
    });
  }

  _onPressLogin() {
    _hideSnackBar();
    String validDataMessage = _validationData();
    if (validDataMessage.isEmpty) {
      FocusScope.of(context).requestFocus(new FocusNode());
      BlocProvider.of<AuthTodoBloc>(context).add(
        LoginRequest(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    } else {
      _showSnackBar(validDataMessage, Colors.red);
    }
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

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthTodoBloc, AuthTodoState>(
      listener: (context, state) {},
      child: BlocBuilder<AuthTodoBloc, AuthTodoState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('Todo Login')),
            body: _renderContent(),
          );
        },
      ),
    );
  }

  GestureDetector _renderContent() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CommonTextField(
              textFieldHint: "username",
              textFieldController: _usernameController,
            ),
            SizedBox(height: 15),
            CommonTextField(
              textFieldHint: "password",
              textFieldController: _passwordController,
              suffixIcon: IconButton(
                  icon: Icon(
                    _isShowPassWord ? Icons.visibility_off : Icons.visibility,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () => _onPressShowPassword()),
              obscureText: _isShowPassWord,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: BlocBuilder<AuthTodoBloc, AuthTodoState>(
                builder: (context, state) {
                  if (state is AuthTodoStateLoading) {
                    return CircularProgressIndicator();
                  } else {
                    return ConstrainedBox(
                        constraints:
                            const BoxConstraints(minWidth: double.infinity),
                        child: TextButton(
                            onPressed: () => _onPressLogin(),
                            child: Text(
                              "Login",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15.0),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        side: BorderSide(
                                            color: Colors.green))))));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
