import 'dart:io';

import 'package:flutter/cupertino.dart';

/// [name] - имя экрана для аналитики. FirebaseAnalyticsObserver шлёт
/// screen_view только для маршрутов с именем, поэтому раньше в Google
/// Analytics не было видно ни одного экрана приложения.
/// Если имя не задано, берётся название класса виджета (CompanyPage и т.п.).
/// Возвращает future маршрута - завершается, когда страницу закрыли.
/// Нужно, чтобы вызывающий мог обновить данные после возврата.
Future<dynamic> goToPage(
  BuildContext context,
  Widget page,
  AxisDirection direction, {
  String? name,
}) {
  final RouteSettings settings = RouteSettings(
    name: name ?? page.runtimeType.toString(),
  );

  Route buildRoute(Widget page) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: (_) => page, settings: settings);
    }
    return CustomPageRoute(
      child: page,
      direction: AxisDirection.left,
      settings: settings,
    );
  }

  return Navigator.push(context, buildRoute(page));
}

class CustomCupertinoPageRoute extends CupertinoPageRoute {
  CustomCupertinoPageRoute({required super.builder});

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // burada default iOS swipe kullanılacak
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0), // sağdan gelsin
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  CustomPageRoute({
    required this.child,
    this.direction = AxisDirection.right,
    super.settings,
  }) : super(
         transitionDuration: const Duration(milliseconds: 200),
         reverseTransitionDuration: const Duration(milliseconds: 200),
         pageBuilder: (context, animation, secondaryAnimation) => child,
       );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) => SlideTransition(
    position: Tween<Offset>(
      begin: getBeginOffset(),
      end: Offset.zero,
    ).animate(animation),
    child: child,
  );

  Offset getBeginOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }
}
