import 'package:flutter/material.dart';
import 'package:flutter_play_with_bloc/screens/weather_screen/weather_bottom_bar/bottom_menu.dart';
import 'package:flutter_play_with_bloc/utils/permission_util.dart';
import 'package:permission_handler/permission_handler.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

int _selectedIndex = 0;

class _BottomBarState extends State<BottomBar> {
  bool _isAllowLocation = false;

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  checkPermission() async {
    final locationPermission =
        await PermissionUtil.requirePermission(Permission.location);
    if (locationPermission == PermissionStatus.denied ||
        locationPermission == PermissionStatus.permanentlyDenied) {
      setState(() {
        _isAllowLocation = false;
      });
    } else {
      setState(() {
        _isAllowLocation = true;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<WeatherBottomMenuItem> childListItems =
        WeatherBottomMenuItems.loadWeatherBottomMenuItems();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather app'),
        ),
        body: Center(child: renderBody(_selectedIndex, childListItems)),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.orange[300],
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          selectedIconTheme: IconThemeData(
            size: 30,
            color: Colors.orange[300],
          ),
          items: <BottomNavigationBarItem>[
            _isAllowLocation
                ? BottomNavigationBarItem(
                    icon: childListItems[0].icon,
                    label: childListItems[0].title,
                  )
                : BottomNavigationBarItem(
                    icon: childListItems[2].icon,
                    label: childListItems[2].title,
                  ),
            BottomNavigationBarItem(
              icon: childListItems[1].icon,
              label: childListItems[1].title,
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }

  Widget renderBody(selectIndex, childListItems) {
    if (!_isAllowLocation) {
      if (selectIndex == 0) {
        return childListItems[2].widget;
      } else {
        return childListItems[selectIndex].widget;
      }
    } else {
      return childListItems[selectIndex].widget;
    }
  }
}
