import 'dart:async';

import 'package:counter/utils/bloc_provider.dart';
import 'package:rxdart/subjects.dart';

class CounterBloc extends BlocBase {
  final _counter = BehaviorSubject<int>.seeded(0);

  Stream<int> get counter => _counter.stream;

  void incrementCounter() {
    _counter.value++;
  }

  void decrementCounter() {
    _counter.value--;
  }

  @override
  void dispose() {
    _counter.close();
  }
}
