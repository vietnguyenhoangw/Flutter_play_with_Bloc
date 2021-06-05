import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_play_with_bloc/contants/list_const.dart';

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
        children: [_renderHeader(context), _renderListMenu(context)],
      ),
    );
  }

  Widget _renderHeader(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
            margin: new EdgeInsets.all(20.0),
            child: Image(
              image: AssetImage("asset/image-background-1.jpg"),
            )));
  }

  Widget _renderListMenu(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
            child: GridView.count(
          physics: new ScrollPhysics(),
          crossAxisCount: 3,
          children: List.generate(HomeMenuList.length, (index) {
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
            children: [
              Expanded(
                  child: Image(
                      image: AssetImage("${HomeMenuList[index].images}"))),
              Expanded(
                  child: Center(
                child: Text(
                  "${HomeMenuList[index].tile}",
                  style: TextStyle(color: Colors.black),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
