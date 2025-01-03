import 'package:flutter/material.dart';
import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';
import 'package:test_olliefy/components/atoms/profile_name.dart';
import 'package:test_olliefy/components/atoms/activity_text.dart';

class NotificationCard extends StatelessWidget {
  final String imagePath;
  final String profileName;
  final String activity;
  final String activityName;
  final String activityDate;

  const NotificationCard({
    Key? key,
    required this.imagePath,
    required this.profileName,
    required this.activity,
    required this.activityName,
    required this.activityDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 370),
      child: Row(
        children: [
          ProfilePicture(borderWidth: 50.0, borderHeight: 50.0, imageWidth: 46.0, imageHeight: 46.0, imageHorizontalPadding: 2.0, imageVerticalPadding: 2.0, imagePath: imagePath),
          SizedBox(width: 8),
          Column(
            children: [
              Row(
                children: [
                  ActivityText(profileName: profileName, activity: activity, activityName: activityName, activityDate: activityDate),

                ]
              ),
            ]
          )
        ]
      )
    );
  }
}
