import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'weather_search_form.dart';

class WeatherSearchPage extends StatefulWidget {
  const WeatherSearchPage({Key? key}) : super(key: key);

  @override
  _WeatherSearchPageState createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WeatherSearchForm(),
    );
  }
}
