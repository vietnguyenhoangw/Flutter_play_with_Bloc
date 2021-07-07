import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_play_with_bloc/contants/list_const.dart';
import 'package:flutter_play_with_bloc/screens/weather_screen/weather_bottom_bar/bottom_bar.dart';

import '../screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _onPressMenuItem(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return CounterScreen();
          }),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return LoginPage();
          }),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return TodoLoginPage();
          }),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return BottomBar();
          }),
        );
        break;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Play with Bloc'),
        ),
      ),
      body: Column(
        children: [_renderHeader(), _renderListMenu()],
      ),
    );
  }

  Widget _renderHeader() {
    return Expanded(
        flex: 2,
        child: Container(
            color: Colors.white,
            margin: new EdgeInsets.all(20.0),
            child: Image(
              image: AssetImage("asset/image-background-1.jpg"),
            )));
  }

  Widget _renderListMenu() {
    return Expanded(
        flex: 3,
        child: Container(
            child: GridView.count(
          physics: new ScrollPhysics(),
          crossAxisCount: 3,
          children: List.generate(homeMenuList.length, (index) {
            return Center(child: _renderMenuItem(context, index));
          }),
        )));
  }

  Widget _renderMenuItem(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.blue[100]!, spreadRadius: 3),
        ],
      ),
      margin: new EdgeInsets.all(20.0),
      child: Center(
        child: TextButton(
          onPressed: () => _onPressMenuItem(index),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 0,
                  child: Image(
                      width: 30,
                      height: 30,
                      image: AssetImage("${homeMenuList[index].images}"))),
              SizedBox(height: 10),
              Expanded(
                  flex: 0,
                  child: Text(
                    "${homeMenuList[index].tile}",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
