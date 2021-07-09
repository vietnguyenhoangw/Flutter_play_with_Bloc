import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/weather/weather_bloc.dart';
import 'package:flutter_play_with_bloc/screens/weather_screen/weather_home/weather_home_form.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return WeatherBloc();
      },
      child: WeatherHomeForm(),
    );
  }
}
