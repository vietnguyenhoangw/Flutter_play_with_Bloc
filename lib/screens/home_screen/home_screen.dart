import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_play_with_bloc/contants/list_const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Play with Bloc'),
        ),
      ),
      body: Column(
        children: [RenderHeader(), renderListMenu()],
      ),
    );
  }
}

class RenderHeader extends StatelessWidget {
  const RenderHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
            margin: new EdgeInsets.all(20.0),
            child: Image(
              image: AssetImage("asset/image-background-1.jpg"),
            )));
  }
}

class renderListMenu extends StatelessWidget {
  const renderListMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
            child: GridView.count(
          physics: new ScrollPhysics(),
          crossAxisCount: 3,
          children: List.generate(HomeMenuList.length, (index) {
            return Center(child: GridItem(index: index));
          }),
        )));
  }
}

class GridItem extends StatelessWidget {
  const GridItem({Key key, this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.blue[100], spreadRadius: 3),
        ],
      ),
      margin: new EdgeInsets.all(20.0),
      child: Center(
        child: TextButton(
          onPressed: () {},
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
