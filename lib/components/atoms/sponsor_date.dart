import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';
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
      child: Text(sponsorDate, style: TextsStyles.sponsorDate()),
          
    );
  }
}
