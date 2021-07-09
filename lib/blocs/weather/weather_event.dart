import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentWeatherRequest extends WeatherEvent {
  final String lat;
  final String long;
  final DateTime today;

  const GetCurrentWeatherRequest({
    required this.lat,
    required this.long,
    required this.today,
  });

  @override
  List<Object> get props => [lat, long];

  @override
  String toString() =>
      'GetCurrentWeatherRequest { lat: $lat} / long: $long}/ today: $today}';
}

class SearchLocationRequest extends WeatherEvent {
  final String locationName;

  const SearchLocationRequest({
    required this.locationName,
  });

  @override
  List<Object> get props => [locationName];

  @override
  String toString() => 'SearchLocationRequest { locationName: $locationName}';
}
