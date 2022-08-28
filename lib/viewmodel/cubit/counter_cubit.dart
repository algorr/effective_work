import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial(false));

  late bool isStarted;
  final CountDownController controller = CountDownController();

  void startCounter() {
    emit(CounterStartedState());
    controller.start();
  }

  void stopCounter() {
    emit(CounterStopedState());
    controller.reset();
  }

  void pauseCounter() {
    emit(CounterPausedState());
    controller.pause();
  }

  void toogleCounterState() {
    isStarted = !isStarted;
  }
}
