import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/fields.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({super.key, required this.label, this.initialSize = 1});

  @override
  State<MainTextField> createState() => _MainTextFieldState();

  final String label;
  final int initialSize;
}

class _MainTextFieldState extends State<MainTextField> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      maxLines: 4,
      minLines: widget.initialSize,
      decoration: FormDecorations.textFieldDecoration(
        labelText: widget.label,
        textColor: AppColors.primaryGray5,
      ),
    );
  }
}



