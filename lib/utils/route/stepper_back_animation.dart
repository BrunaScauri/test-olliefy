import 'package:flutter/material.dart';

Widget stepperBackAnimation(Widget child, Animation<double> animation, {Widget? previousChild}) {
  return Stack(
    children: <Widget>[
      if (previousChild != null) previousChild, // Keep the previous step static
      SlideTransition(
        position: Tween<Offset>(
          begin: previousChild != null ? Offset.zero : Offset.zero, // Ensure content is visible
          end: const Offset(1.0, 0.0), // Moves out to the right
        ).animate(animation),
        child: child,
      ),
    ],
  );
}
