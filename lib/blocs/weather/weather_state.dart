import 'package:equatable/equatable.dart';
import 'package:flutter_play_with_bloc/modals/location_weather.dart';
import 'package:flutter_play_with_bloc/modals/weather.dart';

class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherStateInitialized extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class GetCurrentLocationWeatherStateSuccess extends WeatherState {
  final Weather weather;
  final LocationWeather locationWeather;

  GetCurrentLocationWeatherStateSuccess(this.weather, this.locationWeather);

  @override
  List<Object> get props => [weather, locationWeather];
}

class GetCurrentLocationWeatherStateFailure extends WeatherState {
  final String getCurrentLocationWeatherError;

  GetCurrentLocationWeatherStateFailure(this.getCurrentLocationWeatherError);

  @override
  List<Object> get props => [getCurrentLocationWeatherError];
}
