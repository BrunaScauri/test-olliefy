import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class RecentSearchesExample extends StatelessWidget {

  const RecentSearchesExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Plaça de la Vila de Madrid',
              style: TextsStyles.settingsSubtitle(),
            ),
            IconButton(
              icon: Icon(Icons.close),
              iconSize: 16,
              color: AppColors.primaryGray10FollowButton,
              onPressed: () {
                // Navigator.pop(context);
              },
            ),
          ]
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Plaça de Sants',
              style: TextsStyles.settingsSubtitle(),
            ),
            IconButton(
              icon: Icon(Icons.close),
              iconSize: 16,
              color: AppColors.primaryGray10FollowButton,
              onPressed: () {
                // Navigator.pop(context);
              },
            ),
          ]
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Plaça de Catalunya',
              style: TextsStyles.settingsSubtitle(),
            ),
            IconButton(
              icon: Icon(Icons.close),
              iconSize: 16,
              color: AppColors.primaryGray10FollowButton,
              onPressed: () {
                // Navigator.pop(context);
              },
            ),
          ]
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Plaça de la Universitat',
              style: TextsStyles.settingsSubtitle(),
            ),
            IconButton(
              icon: Icon(Icons.close),
              iconSize: 16,
              color: AppColors.primaryGray10FollowButton,
              onPressed: () {
                // Navigator.pop(context);
              },
            ),
          ]
        ),
      ]
    );
  }
}