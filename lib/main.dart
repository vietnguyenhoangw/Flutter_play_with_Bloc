import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/counter/counter.dart';
import 'package:flutter_play_with_bloc/blocs/login/login.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/auth/auth_bloc.dart';
import 'package:flutter_play_with_bloc/screens/counter_screen/counter_screen.dart';
import 'package:flutter_play_with_bloc/screens/home_screen/home_screen.dart';
import 'package:flutter_play_with_bloc/screens/login_screen/login_page.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
    BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
    BlocProvider<AuthTodoBloc>(create: (context) => AuthTodoBloc())
  ], child: MyApp()));
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
            ),
        "/login": (context) => BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return LoginPage();
              },
            )
      },
    );
  }
}
