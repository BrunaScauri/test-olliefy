import 'package:flutter/material.dart';

class slideOutgoingDown extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  slideOutgoingDown({required this.exitPage, required this.enterPage}) : super(
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
            end: const Offset(0.0, 1.0),
          ).animate(animation),
          child: exitPage,
        ),
      ],
    ),
  );
}