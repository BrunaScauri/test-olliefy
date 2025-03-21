import 'package:flutter/material.dart';

class slideOutgoingRight extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  slideOutgoingRight({required this.exitPage, required this.enterPage}) : super(
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
    ) =>
        Stack(
      children: <Widget>[
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: Offset.zero,
          ).animate(animation),
          child: enterPage,
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(1.0, 0.0),
          ).animate(animation),
          child: exitPage,
        ),
      ],
    ),
  );
}