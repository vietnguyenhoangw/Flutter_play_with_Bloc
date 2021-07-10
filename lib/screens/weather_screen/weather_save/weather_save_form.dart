import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_play_with_bloc/modals/weather.dart';
import 'package:flutter_play_with_bloc/utils/utils.dart';
import 'package:intl/intl.dart';

class WeatherSaveForm extends StatefulWidget {
  const WeatherSaveForm({Key? key}) : super(key: key);

  @override
  _WeatherSaveFormState createState() => _WeatherSaveFormState();
}

class _WeatherSaveFormState extends State<WeatherSaveForm> {
  Weather currentWeather = new Weather();
  String image = "";
  String date = "";

  @override
  void initState() {
    super.initState();
    _getSaveWeatherFromLocal();
  }

  _getSaveWeatherFromLocal() async {
    SpUtil spUtil = new SpUtil();
    dynamic weatherLocalData =
        await spUtil.getStringFromLocal(SpUtilKey.weather.toString());
    Weather weather = Weather.fromJson(json.decode(weatherLocalData));
    setState(() {
      currentWeather = weather;
    });
  }

  Container _buildContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(8),
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
      child: Row(
        children: [
          _buildLeftContent(),
          _buildRightContent(),
        ],
      ),
    );
  }

  Expanded _buildLeftContent() {
    if (currentWeather.weatherStateAbbr != null) {
      image = Weather()
          .returnImageWeather(currentWeather.weatherStateAbbr.toString());
    }
    return Expanded(
        flex: 0,
        child: image.isNotEmpty
            ? Image.network(
                image,
                height: 50,
                width: 50,
              )
            : Container());
  }

  Expanded _buildRightContent() {
    if (currentWeather.created != null) {
      final DateTime parseDate =
          DateTime.parse(currentWeather.created.toString());
      date = DateFormat('dd/MM/yyyy - HH:mm a').format(parseDate);
    }
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Row(
            children: [
              _buildWeatherInfo(
                currentWeather.weatherStateName.toString(),
                "",
              ),
              _buildWeatherInfo(
                "",
                date,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 0,
                child: _buildWeatherInfo(
                  "Min: ",
                  currentWeather.minTemp.toString().substring(0, 4),
                ),
              ),
              Expanded(
                flex: 0,
                child: _buildWeatherInfo(
                  "max: ",
                  currentWeather.maxTemp.toString().substring(0, 4),
                ),
              ),
              Expanded(
                flex: 0,
                child: _buildWeatherInfo(
                  "Humidity: ",
                  "${currentWeather.humidity}%",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding _buildWeatherInfo(String? title, String? value) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          Container(
            child: Text(
              title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Text(value!),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save"),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(8),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return _buildContent();
        },
      ),
    );
  }
}
