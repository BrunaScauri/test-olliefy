import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class FilterButton extends StatefulWidget {
  final String text;
  final String? iconPath;
  final bool isSelected;
  final bool? multipleSelected;
  final VoidCallback onPressed;
  final Color selectedColor;

  const FilterButton({
    Key? key,
    required this.text,
    this.iconPath,
    required this.isSelected,
    this.multipleSelected,
    required this.onPressed,
    this.selectedColor = AppColors.primaryGold60,
  }) : super(key: key);

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    final bool selected = widget.multipleSelected ?? widget.isSelected;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton.icon(
        onPressed: widget.onPressed,
        icon: widget.iconPath == null
          ? SizedBox.shrink()
          : Image.asset(widget.iconPath!, width: 24, height: 24),
        label: Text(
          widget.text,
          style: UserStoreStyles.itemDescription(),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: selected ? widget.selectedColor : AppColors.primaryClay5,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        )
      )
    );
  }
}

