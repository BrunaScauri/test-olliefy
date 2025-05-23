import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/colors.dart';

class MainConfirmButton extends StatefulWidget {
  @override
  _MainConfirmButtonState createState() => _MainConfirmButtonState();
  final String title;
  final GestureTapCallback onTap;
  final Size minimumSize;

  const MainConfirmButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.minimumSize = const Size(350, 60),
  }) : super(key: key);
}

class _MainConfirmButtonState extends State<MainConfirmButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      child: Text(widget.title, style: TextStyles.elevatedButtonText(color: AppColors.primaryBlack),
      ),
      style: ButtonStyles.elevatedButton(backgroundColor: AppColors.primaryGold60, minimumSize: widget.minimumSize),
    );
  }
}
