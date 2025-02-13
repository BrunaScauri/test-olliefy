import 'package:flutter/material.dart';

Widget stepperAnimation(Widget child, Animation<double> animation, {Widget? previousChild}) {
  return Stack(
    children: <Widget>[
      if (previousChild != null)
        FadeTransition(
          opacity: Tween<double>(begin: 1.0, end: 1.0).animate(animation),
          child: previousChild,
        ),
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0), // New screen enters from the right
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    ],
  );
}
