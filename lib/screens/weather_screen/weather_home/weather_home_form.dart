import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeatherHomeForm extends StatefulWidget {
  const WeatherHomeForm({Key? key}) : super(key: key);

  @override
  _WeatherHomeFormState createState() => _WeatherHomeFormState();
}

class _WeatherHomeFormState extends State<WeatherHomeForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("HOME"),
    );
  }
}
