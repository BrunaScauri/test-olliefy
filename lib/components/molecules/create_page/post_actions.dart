import 'package:flutter/material.dart';
import 'package:test_olliefy/components/atoms/create_page/choose_a_spot.dart';

import 'package:test_olliefy/components/atoms/create_page/post_icon.dart';

class PostActions extends StatelessWidget {
  const PostActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChooseASpot(),
        SizedBox(height: 30),
        PostIcon(),
      ]
    );
  }
}