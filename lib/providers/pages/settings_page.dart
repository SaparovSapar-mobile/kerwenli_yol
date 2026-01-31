import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/providers/settings.dart';
import 'package:shared_preferences_riverpod/shared_preferences_riverpod.dart';

var selectedSettingPartIndexProvider = StateProvider<int>((ref) => 0);

final openNotificationProvider = createPrefProvider<bool>(
  prefs: (_) => prefs,
  prefKey: "open_notification",
  defaultValue: true,
);

final passCodeProvider = createPrefProvider<int>(
  prefs: (_) => prefs,
  prefKey: "pass_code",
  defaultValue: 0,
);
