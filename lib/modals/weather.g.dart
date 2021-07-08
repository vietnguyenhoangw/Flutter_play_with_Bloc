// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    id: json['id'],
    weatherStateName: json['weather_state_name'] as String?,
    weatherStateAbbr: json['weather_state_abbr'] as String?,
    windDirectionCompass: json['wind_direction_compass'] as String?,
    created: json['created'] as String?,
    applicableDate: json['applicable_date'] == null
        ? null
        : DateTime.parse(json['applicable_date'] as String),
    minTemp: json['min_temp'],
    maxTemp: json['max_temp'],
    theTemp: json['the_temp'],
    windSpeed: json['wind_speed'],
    windDirection: json['wind_direction'],
    airPressure: json['air_pressure'],
    humidity: json['humidity'],
    visibility: json['visibility'],
    predictability: json['predictability'],
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'weather_state_name': instance.weatherStateName,
      'weather_state_abbr': instance.weatherStateAbbr,
      'wind_direction_compass': instance.windDirectionCompass,
      'created': instance.created,
      'applicable_date': instance.applicableDate?.toIso8601String(),
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'the_temp': instance.theTemp,
      'wind_speed': instance.windSpeed,
      'wind_direction': instance.windDirection,
      'air_pressure': instance.airPressure,
      'humidity': instance.humidity,
      'visibility': instance.visibility,
      'predictability': instance.predictability,
    };
