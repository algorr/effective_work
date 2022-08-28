part of 'counter_cubit.dart';

abstract class CounterState {}

class CounterInitial extends CounterState {
  bool isStarted = false;

  CounterInitial(this.isStarted);

  
}

class CounterStartedState extends CounterState {}

class CounterStopedState extends CounterState {}

class CounterPausedState extends CounterState {}
