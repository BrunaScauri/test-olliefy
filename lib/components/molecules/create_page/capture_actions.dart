import 'package:flutter/material.dart';

import 'package:test_olliefy/components/atoms/create_page/upload_icon.dart';
import 'package:test_olliefy/components/atoms/create_page/record_icon.dart';

class CaptureActions extends StatelessWidget {
  const CaptureActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      top: MediaQuery.of(context).size.height - 170,
      bottom: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UploadIcon(),
          SizedBox(width: 30),
          RecordIcon(),
          SizedBox(width: 30),
          Container()
        ]
      )
    );
  }
}