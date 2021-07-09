import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_play_with_bloc/screens/permission_require/permission_require.dart';
import 'package:flutter_play_with_bloc/screens/weather_screen/weather_home/weather_home.dart';
import 'package:flutter_play_with_bloc/screens/weather_screen/weather_save/weather_save_page.dart';

class WeatherBottomMenuItem {
  String id;
  String title;
  dynamic icon;
  Widget widget;

  WeatherBottomMenuItem({
    required this.id,
    required this.title,
    required this.icon,
    required this.widget,
  });
}

class WeatherBottomMenuItems {
  static List<WeatherBottomMenuItem> _allWeatherBottomMenu =
      <WeatherBottomMenuItem>[];

  static loadWeatherBottomMenuItems() {
    _allWeatherBottomMenu = <WeatherBottomMenuItem>[
      WeatherBottomMenuItem(
        id: "home",
        title: "Home Weather",
        icon: Icon(Icons.home),
        widget: WeatherHomePage(),
      ),
      WeatherBottomMenuItem(
        id: "Save",
        title: "Weather save",
        icon: Icon(Icons.favorite),
        widget: WeatherSavePage(),
      ),
      WeatherBottomMenuItem(
        id: "permission-require",
        title: "Home Weather",
        icon: Icon(Icons.home),
        widget: PermissionRequireForm(permissionId: "location"),
      )
    ];
    return _allWeatherBottomMenu;
  }
}
