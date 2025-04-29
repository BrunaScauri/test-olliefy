import 'package:flutter/material.dart';
import 'dart:async'; 
import 'package:flutter_svg/svg.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/screens/main_screen.dart';
import 'package:test_olliefy/utils/route/fade_incoming.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

  class _SplashscreenState extends State<Splashscreen> {
    double _progressValue = 0.0;
    late Timer _timer;

    @override
    void initState() {
      super.initState();
      _simulateLoading();
    }

    void _simulateLoading() {
      _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
        setState(() {
          _progressValue += 0.01;
        });

        if (_progressValue >= 1.0) {
          _timer.cancel(); 
          Navigator.of(context).pushReplacement(
            createRoute(MainScreen()),
          );
        }
      });
    }

    @override
    void dispose() {
      _timer.cancel(); 
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(16, 16, 15, 1),
        body: SafeArea( 
          child: 
          Column(children: [  
            Flexible(flex: 5, child: Container()),
            SvgPicture.asset('assets/skateboard_only_logo.svg', colorFilter: const ColorFilter.mode(AppColors.primaryGold30, BlendMode.srcIn), height: 100),
            const SizedBox(height: 48),
            Flexible(flex: 4, child: Container()),
            const Image(image: AssetImage('assets/splashscreen/Animation.gif'), height: 100, width: 200),
          Container(
            width: 80,
            child: LinearProgressIndicator(value: _progressValue, valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(222, 199, 55, 1)), backgroundColor: Colors.white),
          ),
          const SizedBox(height: 40),
          ],)
        )
      );
    }
  }