import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentWeatherRequest extends WeatherEvent {
  final String lat;
  final String long;

  const GetCurrentWeatherRequest({
    required this.lat,
    required this.long,
  });

  @override
  List<Object> get props => [lat, long];

  @override
  String toString() => 'GetCurrentWeatherRequest { lat: $lat} /  long: $long}';
}

class GetCurrentWeatherSuccess extends WeatherEvent {}

class GetCurrentWeatherError extends WeatherEvent {
  final String errorMessage;

  const GetCurrentWeatherError({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'GetCurrentWeatherError error: $errorMessage';
}
