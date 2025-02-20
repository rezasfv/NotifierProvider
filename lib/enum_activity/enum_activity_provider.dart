import 'package:notifier/enum_activity/enum_activity_state.dart';
import 'package:notifier/models/activity.dart';
import 'package:notifier/provider/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'enum_activity_provider.g.dart';

@riverpod
class EnumActivity extends _$EnumActivity {
  @override
  EnumActivityState build() {
    ref.onDispose(() {
      print('[EnumActivityProvider] Disposed');
    });

    return EnumActivityState.initial();
  }

  Future<void> fetchActivity(String activityTypes) async {
    state = state.copyWith(status: ActivityStatus.loading);

    try {
      final response = await ref.read(dioProvider).get('?type=$activityTypes');

      final activity = Activity.fromJson(response.data);

      state = state.copyWith(
        status: ActivityStatus.success,
        activity: activity,
      );
    } catch (e) {
      state = state.copyWith(
        status: ActivityStatus.failure,
        error: e.toString(),
      );
    }
  }
}
