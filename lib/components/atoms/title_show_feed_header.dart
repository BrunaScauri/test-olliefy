import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class TitleShowFeedHeader extends StatelessWidget {
  final String title;

  const TitleShowFeedHeader({
    Key? key,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextsStyles.spacedGray()),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 11.3),
              child: Image.asset('assets/map_page/icons/show_feed_icon.png', fit: BoxFit.cover,height: 9.9, width: 9.1),
            ),
            Text('Show Feed', style: TextsStyles.showMore()),
          ],
        )
      ]
    );
  }
}
