import 'dart:io';

import 'package:flutter/cupertino.dart';

goToPage(BuildContext context, Widget page, AxisDirection direction) {
  Route buildRoute(Widget page) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: (_) => page);
    }
    return CustomPageRoute(child: page, direction: AxisDirection.left);
  }

  Navigator.push(context, buildRoute(page));
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

  CustomPageRoute({required this.child, this.direction = AxisDirection.right})
    : super(
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
