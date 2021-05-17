import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/counter/counter.dart';
import 'package:flutter_play_with_bloc/blocs/counter/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  _onPressIncrease() {
    BlocProvider.of<CounterBloc>(context).add(IncreaseCounter());
  }

  _onPressDecrease() {
    BlocProvider.of<CounterBloc>(context).add(DecreaseCounter());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(title: Text('Counter')),
          body: _renderContent(context),
          floatingActionButton: _renderFotter(context));
    });
  }

  Widget _renderContent(BuildContext context) {
    return Center(
      child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.blue[100], spreadRadius: 3),
            ],
          ),
          child: Center(
            child: Text(
              BlocProvider.of<CounterBloc>(context).state.counter.toString(),
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          )),
    );
  }

  Widget _renderFotter(BuildContext context) {
    return Container(
      child: new Row(
        children: [
          new Spacer(flex: 1),
          new FloatingActionButton(
            onPressed: () => _onPressDecrease(),
            child: const Icon(Icons.arrow_circle_down),
            backgroundColor: Colors.blue,
          ),
          new SizedBox(width: 10),
          new FloatingActionButton(
            onPressed: () => _onPressIncrease(),
            child: const Icon(Icons.arrow_circle_up_outlined),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
