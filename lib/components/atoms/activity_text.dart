import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/components/atoms/profile_name.dart';

class ActivityText extends StatelessWidget {
  final String profileName;
  final String activity;
  final String activityName;
  final String activityDate;

  const ActivityText({
    Key? key,
    this.profileName = '',
    this.activity = '',
    this.activityName = '',
    this.activityDate = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              ProfileName(profileName: profileName),
              SizedBox(width: 5),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  children: [
                    TextSpan(text: activity, style: UserNotifsStyles.activity()),
                    TextSpan(
                      text: activityName,
                      style: UserNotifsStyles.activity(),
                    ),
                  ]
                )
              ),
            ]
          ),
          Row(
            children: [
              Text(
                activityDate,
                style: UserNotifsStyles.activityDate(),
              ),
            ]
          )
        ]
      )
    );
  }
}