import 'package:flutter/material.dart';

/// Сплеш-экран, нарисованный во Flutter.
///
/// Нативного сплеша недостаточно: на Android 12+ его рисует система и
/// показывает только круглую иконку по центру - ни надписи "TÄJIR TRADE",
/// ни нижней подписи туда не попадает. Поэтому сразу после запуска
/// показываем этот экран, он выглядит одинаково на всех версиях и на iOS.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // фон-градиент
          Image.asset('assets/images/splash_bg.png', fit: BoxFit.cover),

          // иконка + надпись TÄJIR TRADE
          Center(
            child: FractionallySizedBox(
              // 34% ширины экрана - размер с макета
              widthFactor: 0.34,
              child: Image.asset(
                'assets/images/splash_logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),

          // подпись снизу
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 24 + MediaQuery.paddingOf(context).bottom,
              ),
              child: FractionallySizedBox(
                widthFactor: 0.62,
                child: Image.asset(
                  'assets/images/splash_branding.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
