import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/counter/counter.dart';
import 'package:flutter_play_with_bloc/screens/counter_screen/counter_screen.dart';
import 'package:flutter_play_with_bloc/screens/home_screen/home_screen.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CounterBloc())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomeScreen(),
      initialRoute: "/",
      routes: {
        "/counter": (context) => BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return CounterScreen();
              },
            )
      },
    );
  }
}
