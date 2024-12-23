import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class SponsorDate extends StatelessWidget {
  final String sponsorDate;

  const SponsorDate({
    Key? key,
    this.sponsorDate = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 230),
      child: Text(
        sponsorDate,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
