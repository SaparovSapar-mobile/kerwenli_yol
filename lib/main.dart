import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/config.dart';
import 'package:kerwenli_yol/enums/theme.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/home.dart';
import 'package:kerwenli_yol/providers/settings.dart';
import 'package:kerwenli_yol/styles/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance(); // shared preferences
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await createDB(); // create database
  await dotenv.load(fileName: ".env"); // load .env file
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ---------- Lang Provider ----------------
    String language = ref.watch(langProvider);

    // ---------- Theme Provider Start --------------
    ThemeMode? themeMode = ThemeMode.system;
    int theme = ref.watch(themeProvider);

    if (theme == ThemeType.system) {
      themeMode = ThemeMode.system;
    } else if (theme == ThemeType.white) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    // ---------- Theme Provider End --------------

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(language),
      home: AppHome(),
    );
  }
}
