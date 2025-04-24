import 'package:flutter/material.dart';

import 'package:test_olliefy/components/atoms/create_page/upload_icon.dart';
import 'package:test_olliefy/components/atoms/create_page/record_icon.dart';

class CaptureActions extends StatelessWidget {
  const CaptureActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UploadIcon(),
        SizedBox(width: 30),
        RecordIcon(),
        SizedBox(width: 30),
        Container(width: 40)
      ]
    );
  }
}