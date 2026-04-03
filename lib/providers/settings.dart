import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_riverpod/shared_preferences_riverpod.dart';

late SharedPreferences prefs;

final StateNotifierProvider<PrefNotifier<String>, String> langProvider =
    createPrefProvider<String>(
      prefs: (_) => prefs,
      prefKey: "lang",
      defaultValue: 'tr',
    );

final StateNotifierProvider<PrefNotifier<int>, int> themeProvider =
    createPrefProvider<int>(
      prefs: (_) => prefs,
      prefKey: "theme",
      defaultValue: ThemeType.system,
    );

final StateNotifierProvider<PrefNotifier<bool>, bool> isFirstTimeProvider =
    createPrefProvider<bool>(
      prefs: (_) => prefs,
      prefKey: "is_first_time",
      defaultValue: true,
    );
