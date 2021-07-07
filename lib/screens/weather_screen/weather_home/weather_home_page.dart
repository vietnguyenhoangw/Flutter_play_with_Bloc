import 'package:flutter/widgets.dart';
import 'package:flutter_play_with_bloc/screens/weather_screen/weather_home/weather_home.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  @override
  Widget build(BuildContext context) {
    return WeatherHomeForm();
  }
}