import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class RecentSearches extends StatelessWidget {

  const RecentSearches({
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
              'Parc del Fòrum',
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
              'Sants Estació',
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
              'Parallel',
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
              'Forum Beach',
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