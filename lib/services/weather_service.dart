import 'dart:convert';
import 'package:flutter_play_with_bloc/modals/location_weather.dart';
import 'package:flutter_play_with_bloc/modals/weather.dart';
import 'package:http/http.dart' as http;

final baseUrl = "https://www.metaweather.com/api";

class WeatherApi {
  Future<dynamic> searchLocationIdAPI(
      {Function(String)? onError,
      required String lat,
      required String long}) async {
    try {
      String endpoint = baseUrl + "/location/search/?lattlong=$lat,$long";
      http.Response response = await http.get(
        Uri.parse(endpoint),
      );
      if (response.statusCode == 200) {
        List<dynamic> bodyResponse = json.decode(response.body);
        LocationWeather locationWeather =
            LocationWeather.fromJsonstringtify(bodyResponse[0]);
        return locationWeather;
      } else {
        return ("Something get wrong! Status code ${response.statusCode}");
      }
    } catch (e) {
      return ("Something get wrong! Status code ${e.toString()}");
    }
  }

  Future<dynamic> getWeatherTodayAPI(
      {Function(String)? onError,
      required int woeid,
      required DateTime date}) async {
    try {
      int currentYear = date.year;
      int currentMoth = date.month;
      int currentDay = date.day;
      String endpoint =
          baseUrl + "/location/$woeid/$currentYear/$currentMoth/$currentDay/";
      http.Response response = await http.get(
        Uri.parse(endpoint),
      );
      if (response.statusCode == 200) {
        List<dynamic> bodyResponse = json.decode(response.body);
        Weather weather = Weather.fromJson(bodyResponse[0]);
        return weather;
      } else {
        return ("Something get wrong! Status code ${response.statusCode}");
      }
    } catch (e) {
      return ("Something get wrong! Status code ${e.toString()}");
    }
  }

  Future<dynamic> searchLocationAPI({
    Function(String)? onError,
    required String location,
  }) async {
    try {
      String endpoint = baseUrl + "/api/location/search/?query=$location";
      http.Response response = await http.get(
        Uri.parse(endpoint),
      );
      if (response.statusCode == 200) {
        List<dynamic> bodyResponse = json.decode(response.body);
        List<LocationWeather> listWeather = [];
        for (var item in bodyResponse) {
          LocationWeather locationWeather =
              LocationWeather.fromJsonstringtify(item);
          if (listWeather.length < 10) {
            listWeather.add(locationWeather);
          }
        }
        return listWeather;
      } else {
        return ("Something get wrong! Status code ${response.statusCode}");
      }
    } catch (e) {
      return ("Something get wrong! Status code ${e.toString()}");
    }
  }
}
