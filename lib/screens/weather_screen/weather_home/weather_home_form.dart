import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/weather/weather.dart';
import 'package:flutter_play_with_bloc/blocs/weather/weather_bloc.dart';
import 'package:flutter_play_with_bloc/modals/location_weather.dart';
import 'package:flutter_play_with_bloc/modals/weather.dart';
import 'package:flutter_play_with_bloc/screens/weather_screen/weather_search/weather_search.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WeatherHomeForm extends StatefulWidget {
  const WeatherHomeForm({Key? key}) : super(key: key);

  @override
  _WeatherHomeFormState createState() => _WeatherHomeFormState();
}

class _WeatherHomeFormState extends State<WeatherHomeForm> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  double latitude = 0;
  double longitude = 0;

  @override
  void initState() {
    super.initState();
    _getCurrentPosition().then((value) => {
          if (value) _getCurrentLocationWeather(),
        });
  }

  Future<bool> _getCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
      return true;
    } catch (e) {
      print("weather_home_form: _getCurrentPosition has an error");
      return false;
    }
  }

  _getCurrentLocationWeather() {
    BlocProvider.of<WeatherBloc>(context).add(GetCurrentWeatherRequest(
      lat: latitude.toString(),
      long: longitude.toString(),
      today: DateTime.now(),
    ));
  }

  _onRefresh() {
    _getCurrentPosition().then((value) => {
          if (value) _getCurrentLocationWeather(),
        });
  }

  _onPressSearch() async {
    LocationWeather location = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return WeatherSearchPage();
      }),
    );
    if (location is LocationWeather) {
      List<dynamic> lattlong = location.lattLong.toString().split(",");
      setState(() {
        latitude = double.parse(lattlong[0]);
        longitude = double.parse(lattlong[1]);
      });
      _getCurrentLocationWeather();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search somewhere",
            onPressed: _onPressSearch,
          )
        ],
      ),
      body: Center(
        child: BlocListener<WeatherBloc, WeatherState>(
            listener: (context, state) {},
            child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
              if (state is WeatherStateLoading) {
                return CircularProgressIndicator();
              } else if (state is GetCurrentLocationWeatherStateSuccess) {
                return Container(
                    child: SmartRefresher(
                  enablePullDown: true,
                  controller: _refreshController,
                  child: _buildScreenContentLayout(state),
                  onRefresh: _onRefresh,
                ));
              } else {
                return Container();
              }
            })),
      ),
    );
  }

  Container _buildScreenContentLayout(
      GetCurrentLocationWeatherStateSuccess weatherState) {
    return Container(
      color: Colors.blue[50],
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: new BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: new BorderRadius.all(
              const Radius.circular(20.0),
            )),
        child: Container(
          margin: const EdgeInsets.all(20),
          child: _buildWeatherContent(weatherState),
        ),
      ),
    );
  }

  Column _buildWeatherContent(
      GetCurrentLocationWeatherStateSuccess weatherState) {
    final Weather weather = weatherState.weather;
    final LocationWeather locationWeather = weatherState.locationWeather;

    final DateTime parseDate = DateTime.parse(weather.created.toString());
    final String formatDate =
        DateFormat('dd/MM/yyyy - HH:mm a').format(parseDate);
    final String imageWeather =
        Weather().returnImageWeather(weather.weatherStateAbbr.toString());

    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLocationTitle(locationWeather.title),
          _buildDate(formatDate),
          _buildImageWeather(imageWeather),
          _buildWeatherTitle(weather.weatherStateName.toString()),
          _buildWeatherInfoContent(weather)
        ]);
  }

  Expanded _buildLocationTitle(String title) {
    return Expanded(
      flex: 0,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Expanded _buildDate(String title) {
    return Expanded(
      flex: 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Expanded _buildImageWeather(String imageUrl) {
    return Expanded(
        flex: 0,
        child: Image.network(
          imageUrl,
          height: 160,
        ));
  }

  Expanded _buildWeatherTitle(String title) {
    return Expanded(
        flex: 0,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ));
  }

  Expanded _buildWeatherInfoContent(Weather weather) {
    return Expanded(
        flex: 0,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _buildWeatherInfo(
                      "High: ",
                      weather.maxTemp.toInt().toString(),
                    ),
                    _buildWeatherInfo(
                      "Low: ",
                      weather.minTemp.toInt().toString(),
                    ),
                    _buildWeatherInfo(
                      "humidity: ",
                      "${weather.humidity.toInt().toString()}%",
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  _buildWeatherInfo(
                    "Wind speed: ",
                    weather.windSpeed.toInt().toString(),
                  ),
                  _buildWeatherInfo(
                    "Wind direction: ",
                    weather.windDirectionCompass.toString(),
                  ),
                  _buildWeatherInfo(
                    "Predictability: ",
                    weather.predictability.toString(),
                  )
                ],
              ))
            ],
          ),
        ));
  }

  Expanded _buildWeatherInfo(String title, String value) {
    return Expanded(
        flex: 0,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
        ));
  }
}
