import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Container(),
      floatingActionButton: Row(
        children: [
          Expanded(child: Spacer(flex: 1)),
          Expanded(
            flex: 0,
            child: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: const Icon(Icons.arrow_circle_down),
              backgroundColor: Colors.blue,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 0,
            child: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: const Icon(Icons.arrow_circle_up_outlined),
              backgroundColor: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
