import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/route/page_slide_animation.dart';


class UserSettings extends StatefulWidget {
	@override
	_UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {

  bool switchValue = true;

  final List<Map<String, dynamic>> items = [
    {'title': 'Edit Profile', 'page': EditProfile()},
    {'title': 'Sponsors received', 'page': SponsorsReceived()},
    {'title': 'Sponsors given', 'page': SponsorsGiven()},
    {'title': 'Report a problem', 'page': ReportProblem()},
    {'title': 'Terms and conditions', 'page': TermsAndConditions()},
    {'title': 'Get in touch', 'page': GetInTouch()},
    {'title': 'Delete account', 'page': DeleteAccount()},
    {'title': 'Logout', 'page': Logout()},
  ];

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: AppColors.primaryWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0),
          child: AppBar(
            title: Text('Settings', style: TextsStyles.profileDataBold()),
            backgroundColor: AppColors.primaryWhite,
          ),
        ),
      ),
			body: Center(
				child: Container(
          constraints: BoxConstraints(maxWidth: 370),
          child:Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Show me on the map', style: TextsStyles.settingsSubtitle()),
                    Switch(
                      value: switchValue,
                      onChanged: (bool value) {
                        setState(() {
                          switchValue = value;
                        });
                      },
                      activeTrackColor: AppColors.primaryGold70SwitchSettings,
                    )
                  ]
                ),
                Expanded(
                  child: ListView.builder( 
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  itemCount: items.length,
                    itemBuilder: (context, index) {
                      final  item = items[index];
                      return ListTile(
                        title: Text(item['title'], style: TextsStyles.settingsSubtitle()),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        onTap: () {
                          Navigator.of(context).push(
                            pageSlideAnimation(item['page'])
                          );
                        },
                      );
                    },
                  )
                ),
              ]
            )
          )
			  ),
      ),
    );
	}
}