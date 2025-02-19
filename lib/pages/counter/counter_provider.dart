import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends Notifier<int> {
  @override
  int build() {
    ref.onDispose(() {
      print('[CounterProvider] Dispose');
    });
    return 0;
  }

  void increment() {
    state++;
  }
}

final counterProvider = NotifierProvider<Counter, int>(() {
  return Counter();
});
