import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

final String baseImageUrl =
    "https://www.metaweather.com/static/img/weather/png/64/";

@JsonSerializable()
class Weather {
  @JsonKey(name: "id")
  dynamic? id;
  @JsonKey(name: "weather_state_name")
  String? weatherStateName;
  @JsonKey(name: "weather_state_abbr")
  String? weatherStateAbbr;
  @JsonKey(name: "wind_direction_compass")
  String? windDirectionCompass;
  @JsonKey(name: "created")
  String? created;
  @JsonKey(name: "applicable_date")
  DateTime? applicableDate;
  @JsonKey(name: "min_temp")
  dynamic? minTemp;
  @JsonKey(name: "max_temp")
  dynamic? maxTemp;
  @JsonKey(name: "the_temp")
  dynamic? theTemp;
  @JsonKey(name: "wind_speed")
  dynamic? windSpeed;
  @JsonKey(name: "wind_direction")
  dynamic? windDirection;
  @JsonKey(name: "air_pressure")
  dynamic? airPressure;
  @JsonKey(name: "humidity")
  dynamic? humidity;
  @JsonKey(name: "visibility")
  dynamic? visibility;
  @JsonKey(name: "predictability")
  dynamic? predictability;

  Weather({
    this.id,
    this.weatherStateName,
    this.weatherStateAbbr,
    this.windDirectionCompass,
    this.created,
    this.applicableDate,
    this.minTemp,
    this.maxTemp,
    this.theTemp,
    this.windSpeed,
    this.windDirection,
    this.airPressure,
    this.humidity,
    this.visibility,
    this.predictability,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  returnImageWeather(String weatherStateAbbr) {
    return baseImageUrl + "$weatherStateAbbr.png";
  }
}
