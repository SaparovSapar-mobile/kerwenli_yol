import 'package:kerwenli_yol/enums/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_riverpod/shared_preferences_riverpod.dart';

late SharedPreferences prefs;

final langProvider = createPrefProvider<String>(
  prefs: (_) => prefs,
  prefKey: "lang",
  defaultValue: 'tr',
);

final themeProvider = createPrefProvider<int>(
  prefs: (_) => prefs,
  prefKey: "theme",
  defaultValue: ThemeType.system,
);

final isFirstTimeProvider = createPrefProvider<bool>(
  prefs: (_) => prefs,
  prefKey: "is_first_time",
  defaultValue: true,
);
