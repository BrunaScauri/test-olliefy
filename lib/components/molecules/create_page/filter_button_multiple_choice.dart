import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';

import 'package:test_olliefy/components/atoms/filter_button.dart';

class FilterButtonMultipleChoice extends StatefulWidget {
  @override
  _FilterButtonMultipleChoiceState createState() => _FilterButtonMultipleChoiceState();
}

class _FilterButtonMultipleChoiceState extends State<FilterButtonMultipleChoice> {
  final String bowlIcon = 'assets/map_page/icons/bowl.png';
  final String gapIcon = 'assets/map_page/icons/gap.png';
  final String halfpipeIcon = 'assets/map_page/icons/halfpipe.png';
  final String manualPadIcon = 'assets/map_page/icons/manual_pad.png';
  final String railIcon = 'assets/map_page/icons/rails.png';
  final String rampIcon = 'assets/map_page/icons/ramp.png';
  final String skateparkIcon = 'assets/map_page/icons/skatepark.png';
  final String stairsIcon = 'assets/map_page/icons/stairs.png';
  final String wallrideIcon = 'assets/map_page/icons/wallride.png';

  Set<int> selectedIndices = {};

  void onButtonPressed(int index) {
    setState(() {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      } else {
        selectedIndices.add(index);
      }
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
            text: 'Bowl',
            iconPath: bowlIcon,
            isSelected: selectedIndices.contains(1),
            multipleSelected: selectedIndices.contains(1),
            onPressed: () => onButtonPressed(1),
            selectedColor: AppColors.primaryGold60,
          ),
          FilterButton(
            text: 'Gap',
            iconPath: gapIcon,
            isSelected: selectedIndices.contains(2),
            multipleSelected: selectedIndices.contains(2),
            onPressed: () => onButtonPressed(2),
            selectedColor: AppColors.primaryGold60,
          ),
          FilterButton(
            text: 'Halfpipe',
            iconPath: halfpipeIcon,
            isSelected: selectedIndices.contains(3),
            multipleSelected: selectedIndices.contains(3),
            onPressed: () => onButtonPressed(3),
            selectedColor: AppColors.primaryGold60,
          ),
          FilterButton(
            text: 'Manual pad',
            iconPath: manualPadIcon,
            isSelected: selectedIndices.contains(4),
            multipleSelected: selectedIndices.contains(4),
            onPressed: () => onButtonPressed(4),
            selectedColor: AppColors.primaryGold60,
          ),
          FilterButton(
            text: 'Rails',
            iconPath: railIcon,
            isSelected: selectedIndices.contains(5),
            multipleSelected: selectedIndices.contains(5),
            onPressed: () => onButtonPressed(5),
            selectedColor: AppColors.primaryGold60,
          ),
          FilterButton(
            text: 'Ramp',
            iconPath: rampIcon,
            isSelected: selectedIndices.contains(6),
            multipleSelected: selectedIndices.contains(6),
            onPressed: () => onButtonPressed(6),
            selectedColor: AppColors.primaryGold60,
          ),
          FilterButton(
            text: 'Skatepark',
            iconPath: skateparkIcon,
            isSelected: selectedIndices.contains(7),
            multipleSelected: selectedIndices.contains(7),
            onPressed: () => onButtonPressed(7),
            selectedColor: AppColors.primaryGold60,
          ),
          FilterButton(
            text: 'Stairs',
            iconPath: stairsIcon,
            isSelected: selectedIndices.contains(8),
            multipleSelected: selectedIndices.contains(8),
            onPressed: () => onButtonPressed(8),
            selectedColor: AppColors.primaryGold60,
          ),
          FilterButton(
            text: 'Wallride',
            iconPath: wallrideIcon,
            isSelected: selectedIndices.contains(9),
            multipleSelected: selectedIndices.contains(9),
            onPressed: () => onButtonPressed(9),
            selectedColor: AppColors.primaryGold60,
          ),
        ],
      ),
    );
  }
}