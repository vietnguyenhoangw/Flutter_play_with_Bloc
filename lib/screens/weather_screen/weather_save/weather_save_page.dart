import 'package:flutter/widgets.dart';
import 'package:flutter_play_with_bloc/screens/weather_screen/weather_save/weather_save.dart';

class WeatherSavePage extends StatefulWidget {
  const WeatherSavePage({Key? key}) : super(key: key);

  @override
  _WeatherSavePageState createState() => _WeatherSavePageState();
}

class _WeatherSavePageState extends State<WeatherSavePage> {
  @override
  Widget build(BuildContext context) {
    return WeatherSaveForm();
  }
}
