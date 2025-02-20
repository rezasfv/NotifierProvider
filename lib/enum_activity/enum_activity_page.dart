import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:notifier/enum_activity/enum_activity_provider.dart';
import 'package:notifier/enum_activity/enum_activity_state.dart';
import 'package:notifier/models/activity.dart';
import 'package:super_bullet_list/bullet_list.dart';

class EnumActivityPage extends ConsumerStatefulWidget {
  const EnumActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EnumActivityPageState();
}

class _EnumActivityPageState extends ConsumerState<EnumActivityPage> {
  @override
  void initState() {
    super.initState();
    ref.read(enumActivityProvider.notifier).fetchActivity(activityTypes[0]);
    Future.delayed(Duration.zero, () {});
  }

  @override
  Widget build(BuildContext context) {
    final activityState = ref.watch(enumActivityProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Title')),
      body: switch (activityState.status) {
        ActivityStatus.initial => const Center(child: Text('data')),
        ActivityStatus.loading => const Center(
          child: CircularProgressIndicator(),
        ),
        ActivityStatus.failure => Center(child: Text(activityState.error)),
        ActivityStatus.success => ActivityWidget(
          activity: activityState.activity,
        ),
      },
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(enumActivityProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
        label: Text('New Activity'),
      ),
    );
  }
}

class ActivityWidget extends StatelessWidget {
  final Activity activity;
  const ActivityWidget({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Text(activity.type),
          Divider(),
          SuperBulletList(
            customBullet: Icon(Icons.check),

            items: [
              Text('activity: ${activity.activity}'),
              Text('accessibility: ${activity.activity}'),
              Text('type'),
              Text('participants'),
              Text('price'),
              Text('key'),
            ],
          ),
        ],
      ),
    );
  }
}
