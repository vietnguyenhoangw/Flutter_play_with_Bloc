// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationWeather _$LocationWeatherFromJson(Map<String, dynamic> json) {
  return LocationWeather(
    distance: json['distance'],
    title: json['title'] as String,
    locationType: json['location_type'] as String,
    woeid: json['woeid'],
    lattLong: json['latt_long'] as String,
  );
}

Map<String, dynamic> _$LocationWeatherToJson(LocationWeather instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'title': instance.title,
      'location_type': instance.locationType,
      'woeid': instance.woeid,
      'latt_long': instance.lattLong,
    };
