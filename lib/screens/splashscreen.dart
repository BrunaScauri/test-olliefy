import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:test_olliefy/services/auth_gate.dart';

import 'package:test_olliefy/utils/colors.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 16, 15, 1),
      body: SafeArea( 
        child: 
        Column(
          children: [  
            Flexible(flex: 5, child: Container()),
            SvgPicture.asset('assets/skateboard_only_logo.svg', colorFilter: const ColorFilter.mode(AppColors.primaryGold30, BlendMode.srcIn), height: 100),
            const SizedBox(height: 48),
            Flexible(flex: 4, child: Container()),
            const Image(image: AssetImage('assets/splashscreen/Animation.gif'), height: 100, width: 200),
            Container(
              width: 80,
              child: ValueListenableBuilder<double>(
                valueListenable: splashProgress,
                builder: (_, progress, __) {
                  return LinearProgressIndicator(
                    value: progress,
                    valueColor: AlwaysStoppedAnimation(AppColors.primaryGold60),
                    backgroundColor: AppColors.primaryWhite,
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
          ]
        )
      )
    );
  }
}