import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncreaseCounter extends CounterEvent {}

class DecreaseCounter extends CounterEvent {}
