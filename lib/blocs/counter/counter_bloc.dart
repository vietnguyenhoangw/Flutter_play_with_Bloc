import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/counter/counter_event.dart';
import 'package:flutter_play_with_bloc/blocs/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncreaseCounter) {
      yield CounterState(counter: state.counter + 1);
    }
    if (event is DecreaseCounter) {
      if (state.counter > 0) {
        yield CounterState(counter: state.counter - 1);
      }
    }
  }
}
