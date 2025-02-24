import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class TitleShowMoreHeader extends StatelessWidget {
  final String title;

  const TitleShowMoreHeader({
    Key? key,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextsStyles.spacedGray(), overflow: TextOverflow.ellipsis),
        Text('Show more', style: TextsStyles.showMore()),
      ]
    );
  }
}
