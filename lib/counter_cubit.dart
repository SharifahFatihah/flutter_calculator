import 'package:day8/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class CounterCubit extends Cubit<int>{
  CounterCubit() : super(0);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }

  void reset() {
    emit(0);
  }

  void multiply() {
    int result = int.parse(inputNum.text) * state;
    emit(result);
  }

  void divide() {
    int result = int.parse(inputNum.text) ~/ state;
    emit(result);
  }
}

