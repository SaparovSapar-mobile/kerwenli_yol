import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/config.dart';
import 'package:kerwenli_yol/enums/theme.dart';
import 'package:kerwenli_yol/firebase_options.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/home.dart';
import 'package:kerwenli_yol/providers/settings.dart';
import 'package:kerwenli_yol/services/analytics_service.dart';
import 'package:kerwenli_yol/services/deep_link_service.dart';
import 'package:kerwenli_yol/styles/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kerwenli_yol/l10n/tk_material_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

late SharedPreferences prefs;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // 2. SharedPreferences ПЕРВЫМ — до всего остального
  prefs = await SharedPreferences.getInstance();

  // 3. Ориентация
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 4. База данных
  await createDB();

  // 5. .env файл
  await dotenv.load(fileName: ".env");

  // 6. Слушатель диплинков (QR-код компании)
  await DeepLinkService.instance.init();

  // 7. Только теперь запускаем приложение
  runApp(const ProviderScope(child: MyApp()));
}

// release motda ayyrmaly
class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
// release motda ayyrmaly

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String language = ref.watch(langProvider);

    ThemeMode? themeMode = ThemeMode.system;
    final int theme = ref.watch(themeProvider);

    if (theme == ThemeType.system) {
      themeMode = ThemeMode.system;
    } else if (theme == ThemeType.white) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // нужен, чтобы открывать страницу компании по ссылке из QR
      navigatorKey: rootNavigatorKey,
      navigatorObservers: [AnalyticsService().observer],
      themeMode: themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        TkMaterialLocalizations.delegate,
        TkCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supported in supportedLocales) {
          if (supported.languageCode == locale?.languageCode) {
            return supported;
          }
        }
        return const Locale('en');
      },
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(language),
      home: AppHome(),
    );
  }
}
