import 'package:flutter/material.dart';

class BaseRoute extends PageRouteBuilder {
  final Widget page;

  BaseRoute({required this.page})
      : super(
    pageBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation) => page,
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) {
      return ScaleTransition(
        scale: animation,
        child: child,
      );
    },
  );
}
