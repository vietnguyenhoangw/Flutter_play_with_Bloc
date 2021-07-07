import 'package:equatable/equatable.dart';

class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherStateInitialized extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class GetCurrentLocationWeatherStateSuccess extends WeatherState {}

class GetCurrentLocationWeatherStateFailure extends WeatherState {}
