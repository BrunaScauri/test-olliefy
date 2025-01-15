import 'package:flutter/material.dart';

Route pageSlideAnimation(
  Widget page, {
  Offset newPageBegin = const Offset(1.0, 0.0),
  Offset oldPageBegin = const Offset(0.0, 0.0),
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curve = Curves.easeInOut;

      var newPageTween = Tween(begin: newPageBegin, end: Offset.zero)
          .chain(CurveTween(curve: curve));
      var newPageAnimation = animation.drive(newPageTween);

      var oldPageTween = Tween(begin: oldPageBegin, end: const Offset(-1.0, 0.0))
          .chain(CurveTween(curve: curve));
      var oldPageAnimation = secondaryAnimation.drive(oldPageTween);

      return Stack(
        children: [
          SlideTransition(
            position: newPageAnimation,
            child: page,
          ),
        ],
      );
    },
  );
}
