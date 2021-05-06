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
        title: Text('Welcome to Flutter'),
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
        flex: 1,
        child: Container(
          child: Center(
            child: Text(
              "Flutter - play with Bloc",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ));
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
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
              child: Image(
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))),
          Expanded(
              child: Center(
            child: Text("${HomeMenuList[index]}"),
          ))
        ],
      ),
    );
  }
}
