import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifier/pages/counter/counter_provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter'),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
