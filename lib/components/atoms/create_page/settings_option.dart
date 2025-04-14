import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
// import 'package:test_olliefy/utils/colors.dart';

class SettingsOption extends StatefulWidget {
  @override
  _SettingsOptionState createState() => _SettingsOptionState();
  final String icon;
  final String title;
  final String description;
  final GestureTapCallback onTap;

  const SettingsOption({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);
}

class _SettingsOptionState extends State<SettingsOption> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.icon),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: TextsStyles.profileDescription()),
              Text(widget.description, style: TextsStyles.profileData())
            ],
          )
        ],
      ),
    );
    
  }
}
