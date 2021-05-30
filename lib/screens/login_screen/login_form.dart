import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/login/login.dart';
import 'package:flutter_play_with_bloc/widgets/text_field.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isShowPassWord = false;

  _onPressShowPassword() {
    setState(() {
      _isShowPassWord = !_isShowPassWord;
    });
  }

  _onPressLogin() {
    _hideSnackBar();
    FocusScope.of(context).requestFocus(new FocusNode());
    BlocProvider.of<LoginBloc>(context).add(
      LoginRequest(
        username: _usernameController.text,
        password: _passwordController.text,
      ),
    );
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
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final String errorLoginMessage = state.errorLogin.toString();
        final bool isLoginRequest = state.isLoginRequest;
        final bool isLoged = state.isLoged;

        if (isLoginRequest == false && errorLoginMessage.isNotEmpty) {
          _hideSnackBar();
          _showSnackBar("$errorLoginMessage", Colors.red);
        }

        if (isLoginRequest == false && isLoged) {
          _hideSnackBar();
          _showSnackBar("Login success", Colors.green[500]!);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('Login')),
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
              child: !BlocProvider.of<LoginBloc>(context).state.isLoginRequest
                  ? ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: TextButton(
                          onPressed: () => _onPressLogin(),
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                EdgeInsets.all(15.0),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      side: BorderSide(color: Colors.green))))))
                  : CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
