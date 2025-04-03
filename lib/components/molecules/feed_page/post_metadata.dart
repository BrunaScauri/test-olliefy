import 'package:flutter/material.dart';

import 'package:test_olliefy/components/molecules/feed_page/post_info.dart';
import 'package:test_olliefy/components/atoms/feed_page/post_description.dart';
import 'package:test_olliefy/components/atoms/feed_page/spot_location.dart';

class PostMetadata extends StatelessWidget {
  const PostMetadata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24,
      left: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostInfo(username: 'Dropindynamo', postTime: 'Yesterday'),
          PostDescription(description: 'Follow the journey of a skateboard to the rhythm of urban beats. Watch as each trick...Follow the journey of a skateboard to the rhythm of urban beats. Watch as each trick...Follow the journey of a skateboard to the rhythm of urban beats. Watch as each trick...Follow the journey of a skateboard to the rhythm of urban beats. Watch as each trick...Follow the journey of a skateboard to the rhythm of urban beats. Watch as each trick...Follow the journey of a skateboard to the rhythm of urban beats. Watch as each trick...'),
          SpotLocation(location: 'Skatepark de la Mar Bella'),
        ]
      )
    );
  }
}