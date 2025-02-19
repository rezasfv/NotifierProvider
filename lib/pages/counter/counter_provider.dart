import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends FamilyNotifier<int, int> {
  @override
  int build(int arg) {
    ref.onDispose(() {
      print('[CounterProvider] Disposed');
    });
    return arg;
  }

  void increment() {
    state++;
  }
}

final counterProvider = NotifierProvider.family<Counter, int, int>(() {
  return Counter();
});
