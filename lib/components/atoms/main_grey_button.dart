import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/colors.dart';

class MainGreyButton extends StatefulWidget {
  @override
  _MainGreyButtonState createState() => _MainGreyButtonState();
  final String title;
  final GestureTapCallback onTap;
  final Size minimumSize;

  const MainGreyButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.minimumSize = const Size(350, 60),
  }) : super(key: key);
}

class _MainGreyButtonState extends State<MainGreyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      child: Text(widget.title, style: TextStyles.elevatedButtonText(color: AppColors.primaryBlack),
      ),
      style: ButtonStyles.elevatedButton(backgroundColor: AppColors.buttonDisabled12, minimumSize: widget.minimumSize),
    );
  }
}
