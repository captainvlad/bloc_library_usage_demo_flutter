import 'dart:developer';

class CounterState {
  final int counter;

  const CounterState({required this.counter});

  factory CounterState.initial() => const CounterState(counter: 0);
}
