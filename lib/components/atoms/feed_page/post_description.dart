import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';

class PostDescription extends StatelessWidget {
  final String description;

  const PostDescription({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 2 / 3,
        child: Text(description, style: FeedStyles.videoDescription()
        ),
      ),
    );
  }
}