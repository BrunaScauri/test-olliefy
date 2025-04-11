import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';

class SidebarActionIcon extends StatefulWidget {
  final String text;
  final String imagePath;
  const SidebarActionIcon({Key? key, this.text = '', this.imagePath = ''}) : super(key: key);

  @override
  State<SidebarActionIcon> createState() => _SidebarActionIconState();
}

class _SidebarActionIconState extends State<SidebarActionIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(widget.text, style: CreateStyles.iconText()),
        ]
      )
    );
  }
}