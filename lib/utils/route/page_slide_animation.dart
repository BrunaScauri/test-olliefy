import 'package:flutter/material.dart';


Route pageSlideAnimation(Widget page, {Offset begin = const Offset(1.0, 0.0), Curve curve = Curves.easeInOut}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween(begin: begin, end: Offset.zero).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
