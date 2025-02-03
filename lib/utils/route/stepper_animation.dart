import 'package:flutter/material.dart';

Widget stepperAnimation(Widget child, Animation<double> animation, Widget? previousChild) {
  return Stack(
    children: <Widget>[
      SlideTransition(
        position: Tween<Offset>(
          begin: Offset.zero,
          end: Offset.zero,
        ).animate(animation),
        child: previousChild,
      ),
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    ],
  );
}