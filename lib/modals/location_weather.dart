import 'package:json_annotation/json_annotation.dart';

part 'location_weather.g.dart';

@JsonSerializable()
class LocationWeather {
  @JsonKey(name: "distance")
  dynamic distance;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "location_type")
  String locationType;
  @JsonKey(name: "woeid")
  dynamic woeid;
  @JsonKey(name: "latt_long")
  String lattLong;

  LocationWeather({
    required this.distance,
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
  });

  factory LocationWeather.fromJson(Map<String, dynamic> json) =>
      _$LocationWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$LocationWeatherToJson(this);

  factory LocationWeather.fromJsonstringtify(dynamic json) {
    return LocationWeather(
      distance: json['distance'] as dynamic,
      title: json['title'] as String,
      locationType: json['location_type'] as String,
      woeid: json['woeid'] as dynamic,
      lattLong: json['latt_long'] as String,
    );
  }
}
