import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/screens/create/post_settings_bottom_sheet/choose_a_spot.dart';

class ChooseASpot extends StatefulWidget {
  const ChooseASpot({super.key});

  @override
  State<ChooseASpot> createState() => _ChooseASpotState();
}

class _ChooseASpotState extends State<ChooseASpot> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const ChooseASpotScreen(),
          ),
        );
      },
      child: Container(
        width: 161,
        height: 40,
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.3),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/create_page/icons/map_pin_icon.png',
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Text('Choose a Spot', style: FeedStyles.profileName())
          ],
        )
      ),
    );
    
  }
}


