import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';

import 'package:test_olliefy/components/atoms/filter_button.dart';

class MarketplaceFilterButtonRow extends StatefulWidget {
  @override
  _MarketplaceFilterButtonRowState createState() => _MarketplaceFilterButtonRowState();
}

class _MarketplaceFilterButtonRowState extends State<MarketplaceFilterButtonRow> {
  int selectedIndex = 0;

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            FilterButton(
              text: 'All',
              isSelected: selectedIndex == 0,
              onPressed: () => onButtonPressed(0),
              selectedColor: AppColors.primaryGold60,
            ),
            SizedBox(width: 8),
            FilterButton(
              text: 'T-Shirts',
              isSelected: selectedIndex == 1,
              onPressed: () => onButtonPressed(1),
              selectedColor: AppColors.primaryGold60,
            ),
            SizedBox(width: 8),
            FilterButton(
              text: 'Shoes',
              isSelected: selectedIndex == 2,
              onPressed: () => onButtonPressed(2),
              selectedColor: AppColors.primaryGold60,
            ),
            SizedBox(width: 8),
            FilterButton(
              text: 'Wheels',
              isSelected: selectedIndex == 3,
              onPressed: () => onButtonPressed(3),
              selectedColor: AppColors.primaryGold60,
            ),
            SizedBox(width: 8),
            FilterButton(
              text: 'Deck',
              isSelected: selectedIndex == 4,
              onPressed: () => onButtonPressed(4),
              selectedColor: AppColors.primaryGold60,
            ),
          ],
        ),
      ),
    );
  }
}