import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/weather/weather.dart';
import 'package:flutter_play_with_bloc/blocs/weather/weather_bloc.dart';
import 'package:geolocator/geolocator.dart';

class WeatherHomeForm extends StatefulWidget {
  const WeatherHomeForm({Key? key}) : super(key: key);

  @override
  _WeatherHomeFormState createState() => _WeatherHomeFormState();
}

class _WeatherHomeFormState extends State<WeatherHomeForm> {
  double latitude = 0;
  double longitude = 0;

  @override
  void initState() {
    super.initState();
    _getCurrentPosition().then((value) => {
          if (value) _getCurrentLocationWeather(),
        });
  }

  Future<bool> _getCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
      return true;
    } catch (e) {
      print("weather_home_form: _getCurrentPosition has an error");
      return false;
    }
  }

  _getCurrentLocationWeather() {
    BlocProvider.of<WeatherBloc>(context).add(GetCurrentWeatherRequest(
      lat: latitude.toString(),
      long: longitude.toString(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("HOME"),
    );
  }
}
