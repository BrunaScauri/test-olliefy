import 'package:flutter/material.dart';

class slideOutgoingDown extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;

  slideOutgoingDown({
    required this.enterPage,
    required this.exitPage,
  }) : super(
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) =>
        enterPage,
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      return Stack(
        children: [
          enterPage,
          SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: Offset(0.0, 1.0),
            ).animate(animation),
            child: exitPage,
          ),
        ],
      );
    },
  );
}