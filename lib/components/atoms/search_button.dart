import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';

class SearchButton extends StatelessWidget {

  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        // openSearchModal();
      },
      child: Image.asset('assets/map_page/icons/search_icon.png', fit: BoxFit.cover,height: 22, width: 22),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(60, 60),
        elevation: 3,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: AppColors.primaryWhite,
      )
    );
  }
}
