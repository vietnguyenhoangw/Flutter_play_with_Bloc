import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/weather/weather.dart';
import 'package:flutter_play_with_bloc/blocs/weather/weather_event.dart';
import 'package:flutter_play_with_bloc/modals/location_weather.dart';
import 'package:flutter_play_with_bloc/modals/weather.dart';
import 'package:flutter_play_with_bloc/services/weather_service.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherStateInitialized());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is GetCurrentWeatherRequest) {
      yield WeatherStateLoading();
      yield await _mapGetCurrentWeatherRequestToState(event);
    }
  }

  Future<WeatherState> _mapGetCurrentWeatherRequestToState(
      GetCurrentWeatherRequest event) async {
    dynamic locationResponse = await WeatherApi().searchLocationIdAPI(
      lat: event.lat,
      long: event.long,
    );
    if (locationResponse is LocationWeather) {
      final int woeid = locationResponse.woeid;
      dynamic weatherResponse = await WeatherApi().getWeatherTodayAPI(
        date: event.today,
        woeid: woeid,
      );
      if (weatherResponse is Weather) {
        return GetCurrentLocationWeatherStateSuccess(
            weatherResponse, locationResponse);
      } else {
        return GetCurrentLocationWeatherStateFailure(
            weatherResponse.toString());
      }
    } else {
      return GetCurrentLocationWeatherStateFailure(locationResponse.toString());
    }
  }
}
