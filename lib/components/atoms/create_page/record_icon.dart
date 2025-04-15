import 'package:flutter/material.dart';

class RecordIcon extends StatefulWidget {
  const RecordIcon({Key? key}) : super(key: key);

  @override
  State<RecordIcon> createState() => _RecordIconState();
}

class _RecordIconState extends State<RecordIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
          },
          child: Container(
            height: 88,
            width: 88,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/create_page/icons/record_icon.png'
                ),
              ),
            ),
          ),
        ),
      ]
    );
  }
}