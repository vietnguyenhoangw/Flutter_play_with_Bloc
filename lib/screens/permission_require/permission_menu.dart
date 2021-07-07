import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_play_with_bloc/utils/permission_util.dart';

class PermissionMenuItem {
  String id;
  String title;
  String description;
  dynamic icon;

  PermissionMenuItem({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });
}

class PermissionMenuItems {
  static List<PermissionMenuItem> _allPermissionMenu = <PermissionMenuItem>[];

  static loadWeatherBottomMenuItems() {
    _allPermissionMenu = <PermissionMenuItem>[
      PermissionMenuItem(
        id: "location",
        title: "Require location",
        description:
            "This feature need to allow location permission. Please check in Setting > Apps > Permissions",
        icon: Icon(
          Icons.location_disabled,
          size: 60.0,
          color: Colors.black,
        ),
      ),
    ];
    return _allPermissionMenu;
  }
}
