import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial(false));

  bool isStarted = false;
  final CountDownController controller = CountDownController();

  void startCounter() {
    toogleCounterState();
    emit(CounterStartedState());
    controller.start();
  }

  void stopCounter() {
    toogleCounterState();
    emit(CounterStopedState());
    controller.reset();
  }

  void pauseCounter() {
    toogleCounterState();
    emit(CounterPausedState());
    controller.pause();
  }

  void toogleCounterState() {
    isStarted = !isStarted;
  }
}
