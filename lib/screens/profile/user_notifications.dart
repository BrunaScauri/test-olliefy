import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';

class UserNotifications extends StatefulWidget {
	@override
	_UserNotificationsState createState() => _UserNotificationsState();
}

class _UserNotificationsState extends State<UserNotifications> {

  final List<Map<String, dynamic>> items = [
    {
   "imagePath":"assets/profile_page/icons/example_pfp/1.jpeg",
   "profileName":"MeruGrzz",
   "activity":"is skating in",
   "activityItem":"Puerto Madero",
   "activityDate":"Just now",
},
{
   "imagePath":"assets/profile_page/icons/example_pfp/7.jpeg",
   "profileName":"Tablasalvaje",
   "activity":"created a new spot:",
   "activityItem":"Tabacalera",
   "activityDate":"30 minutes ago",
},
{
   "imagePath":"assets/profile_page/icons/example_pfp/0.jpeg",
   "profileName":"Ojo_depez",
   "activity":"added",
   "activityItem":"Galactic T-Shirt",
   "activityDescription":"for 10€",
   "activityDate":"Yesterday",
},
{
   "imagePath":"assets/profile_page/icons/example_pfp/0.jpeg",
   "profileName":"Fireforfire",
   "activity":"created a new event:",
   "activityItem":"Morón Championship.",
  //  "activityDescription":"",
   "activityDate":"8 hours ago",
},
{
   "imagePath":"assets/profile_page/icons/example_pfp/3.jpeg",
   "profileName":"Lodozzz",
   "activity":"posted a new photograph.",
  //  "activityItem":"added ",
  //  "activityDescription":"added ",
   "activityDate":"3 weeks ago",
},
{
   "imagePath":"assets/profile_page/icons/example_pfp/7.jpeg",
   "profileName":"Tablasalvaje",
   "activity":"won the challenge:",
  //  "activityItem":"added ",
   "activityDescription":"1000 flips in the city.",
   "activityDate":"3 weeks ago",
},
  ];

	@override
	Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 370),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: AppBar(
                title: Text('Notifications', style: TextsStyles.profileDataBold()),
              ),
            ),
          )
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 370),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: ListView.separated(
                  itemCount: items.length,
                  itemBuilder: (context, index) { //logica para caso lista vazia
                    final item = items[index];
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ProfilePicture(
                            borderWidth: 50.0,
                            borderHeight: 50.0,
                            imageWidth: 46.0,
                            imageHeight: 46.0,
                            imageHorizontalPadding: 2.0,
                            imageVerticalPadding: 2.0,
                            imagePath: item['imagePath'],
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  maxLines: 3,
                                  softWrap: true,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: item['profileName'] ?? '',
                                        style: UserNotifsStyles.activityItem(),
                                      ),
                                      TextSpan(
                                        text: ' ${item['activity'] ?? ''}',
                                        style: UserNotifsStyles.activity(),
                                      ),
                                      TextSpan(
                                        text: ' ${item['activityItem'] ?? ''}',
                                        style: UserNotifsStyles.activityItem(),
                                      ),
                                      TextSpan(
                                        text: ' ${item['activityDescription'] ?? ''}',
                                        style: UserNotifsStyles.activity(),
                                      ),
                                    ],
                                    style: TextsStyles.sponsorDate(),
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  item['activityDate'] ?? '',
                                  style: UserNotifsStyles.activityDate(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 11),
              ),
            )
          ),
        ),
    );
  }
}