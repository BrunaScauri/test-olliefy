import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';

import 'package:test_olliefy/components/atoms/filter_button.dart';
import 'package:test_olliefy/components/atoms/search_button.dart';

class FilterButtonRowLineBreak extends StatefulWidget {
  @override
  _FilterButtonRowLineBreakState createState() => _FilterButtonRowLineBreakState();
}

class _FilterButtonRowLineBreakState extends State<FilterButtonRowLineBreak> {
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          FilterButton(
            text: 'Halfpipe',
            iconPath: halfpipeIcon,
            isSelected: selectedIndex == 1,
            onPressed: () => onButtonPressed(1),
            selectedColor: AppColors.primaryGold60,
          ),
          FilterButton(
            text: 'Bowl',
            iconPath: bowlIcon,
            isSelected: selectedIndex == 2,
            onPressed: () => onButtonPressed(2),
            selectedColor: AppColors.primaryGold60,
          ),
          FilterButton(
            text: 'Rails',
            iconPath: railIcon,
            isSelected: selectedIndex == 3,
            onPressed: () => onButtonPressed(3),
            selectedColor: AppColors.primaryGold60,
          ),
          FilterButton(
            text: 'Stairs',
            iconPath: stairsIcon,
            isSelected: selectedIndex == 4,
            onPressed: () => onButtonPressed(4),
            selectedColor: AppColors.primaryGold60,
          ),
          FilterButton(
            text: 'Ramp',
            iconPath: rampIcon,
            isSelected: selectedIndex == 5,
            onPressed: () => onButtonPressed(5),
            selectedColor: AppColors.primaryGold60,
          ),
        ],
      ),
    );
  }
}