import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/weather/weather.dart';
import 'package:flutter_play_with_bloc/blocs/weather/weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherStateInitialized());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is GetCurrentWeatherRequest) {
      yield await _mapGetCurrentWeatherRequestToState(event);
    }
  }

  Future<WeatherState> _mapGetCurrentWeatherRequestToState(
      GetCurrentWeatherRequest event) async {
    print('BLOC EVENT: ${event}');

    return GetCurrentLocationWeatherStateSuccess();
  }
}
