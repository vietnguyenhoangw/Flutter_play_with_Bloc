import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CommonTextField extends StatefulWidget {
  final textFieldController;
  String textFieldHint;
  IconButton suffixIcon;
  bool obscureText;

  CommonTextField(
      {this.textFieldController,
      this.textFieldHint,
      this.suffixIcon,
      this.obscureText});

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
      obscureText: widget.obscureText != null ? widget.obscureText : false,
      autovalidateMode: AutovalidateMode.always,
      controller: widget.textFieldController,
      decoration: InputDecoration(
          hintText: widget.textFieldHint, suffixIcon: widget.suffixIcon),
    ));
  }
}
