import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/route/slide_incoming_from_bottom.dart';

import 'package:test_olliefy/screens/search/search_page.dart';
import 'package:test_olliefy/screens/map/map_screen.dart';

class SearchButton extends StatelessWidget {

  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: (){
           Navigator.of(context).push(
            SlideIncomingFromBottom(
              enterPage: SearchPage(), exitPage: MapScreen(),
            ),
          );
        },
        child: Image.asset('assets/map_page/icons/search_icon.png', fit: BoxFit.cover,height: 22, width: 22),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(60, 60),
          elevation: 4,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: AppColors.primaryWhite,
        )
      )
    );
  }
}
