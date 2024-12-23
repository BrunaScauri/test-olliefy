import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class UserNotifications extends StatefulWidget {
	@override
	_UserNotificationsState createState() => _UserNotificationsState();
}

class _UserNotificationsState extends State<UserNotifications> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0),
          child: AppBar(
            title: Text('Notifications', style: TextsStyles.profileDataBold()),
            backgroundColor: AppColors.primaryWhite,
          ),
        ),
      ),
			body: Center(
				child: Container(
          constraints: BoxConstraints(maxWidth: 370),
          child:Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              children: [
                Text('Notifications'),

                //if cases/switch cases for dates: minutes, hours, days, weeks, entire dates
                
              ]
            )
          )
        )
			),
      
		);
	}
}