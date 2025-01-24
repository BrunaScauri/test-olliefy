import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';

import 'package:test_olliefy/screens/main_screen.dart';
import 'package:test_olliefy/screens/map/location_bottom_sheet.dart';
import 'package:test_olliefy/components/atoms/filter_button.dart';
import 'package:test_olliefy/components/atoms/search_button.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final String bowlIcon = 'assets/map_page/icons/bowl.png';
  final String halfpipeIcon = 'assets/map_page/icons/halfpipe.png';
  final String railIcon = 'assets/map_page/icons/rails.png';
  final String rampIcon = 'assets/map_page/icons/ramp.png';
  final String stairsIcon = 'assets/map_page/icons/stairs.png';

  int selectedIndex = 0;

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Stack(
        children: [
          SizedBox(
            height: 124,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 64, bottom: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SearchButton(),
                  SizedBox(width: 8),
                  FilterButton(text: 'All', isSelected: selectedIndex == 0, onPressed: () => onButtonPressed(0)),
                  SizedBox(width: 8),
                  FilterButton(text: 'Halfpipe', iconPath: halfpipeIcon, isSelected: selectedIndex == 1, onPressed: () => onButtonPressed(1)),
                  SizedBox(width: 8),
                  FilterButton(text: 'Bowl', iconPath: bowlIcon, isSelected: selectedIndex == 2, onPressed: () => onButtonPressed(2)),
                  SizedBox(width: 8),
                  FilterButton(text: 'Rails', iconPath: railIcon, isSelected: selectedIndex == 3, onPressed: () => onButtonPressed(3)),
                  SizedBox(width: 8),
                  FilterButton(text: 'Stairs', iconPath: stairsIcon, isSelected: selectedIndex == 4, onPressed: () => onButtonPressed(4)),
                  SizedBox(width: 8),
                  FilterButton(text: 'Ramp', iconPath: rampIcon, isSelected: selectedIndex == 5, onPressed: () => onButtonPressed(5)),
                ],
              ),
            ),
          ),
          LocationBottomSheet(),
        ],
      )  
    );
  }
}
