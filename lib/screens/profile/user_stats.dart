import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/screens/main_screen.dart';

class UserStats extends StatefulWidget {
  @override
  _UserStatsState createState() => _UserStatsState();
}

class _UserStatsState extends State<UserStats> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder:(context, animation, secondaryAnimation) => MainScreen(),
                )
              );
            },
            child: Text('Return to main screen')
          )
        )
      );
  }
}
