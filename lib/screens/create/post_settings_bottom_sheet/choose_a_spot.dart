import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/screens/app_tab.dart';

class ChooseASpotScreen extends StatefulWidget {
  const ChooseASpotScreen({super.key});

  @override
  State<ChooseASpotScreen> createState() => _ChooseASpotScreenState();
}

class _ChooseASpotScreenState extends State<ChooseASpotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        leadingWidth: 40.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => AppTab(initialIndex: 2),
              ),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppColors.primaryBlack
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 262,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlack,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('You can adjust your position on the map.', style: FeedStyles.videoDate())
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}


// showModalBottomSheet<dynamic>(
//           isScrollControlled: true,
//           context: context,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(20),
//               topLeft: Radius.circular(30),
//             ),
//           ),
//           builder: (BuildContext context) {
//             return const ChooseASpotScreen();
//           },
//         );