import 'package:flutter/material.dart';

class UploadIcon extends StatefulWidget {
  const UploadIcon({Key? key}) : super(key: key);

  @override
  State<UploadIcon> createState() => _UploadIconState();
}

class _UploadIconState extends State<UploadIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/create_page/icons/upload_icon.png'
                  ),
                ),
              ),
            ),
          ),
        ]
      )
    );
  }
}