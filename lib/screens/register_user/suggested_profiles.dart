import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_olliefy/utils/styles/buttons.dart';

import 'package:test_olliefy/services/user_modal.dart';
import 'package:test_olliefy/components/organisms/suggested_profiles_card.dart';
import 'package:test_olliefy/components/atoms/follow_button.dart';
import 'package:test_olliefy/components/atoms/following_button.dart';

class SuggestedProfiles extends StatefulWidget {
  @override
  _SuggestedProfilesState createState() => _SuggestedProfilesState();
}

class _SuggestedProfilesState extends State<SuggestedProfiles> {
  final List<Map<String, dynamic>> items = [
    {'imagePath': 'assets/profile_page/icons/example_pfp/0.jpeg', 'profileName': 'MeruGrzz', 'following': false},
    {'imagePath': 'assets/profile_page/icons/example_pfp/1.jpeg', 'profileName': 'Tablasalvaje', 'following': true},
    {'imagePath': 'assets/profile_page/icons/example_pfp/2.jpeg', 'profileName': 'trickwizard', 'following': true},
    {'imagePath': 'assets/profile_page/icons/example_pfp/3.jpeg', 'profileName': 'board_beast', 'following': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 370),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyles.primaryHeader(),
                    children: [
                      TextSpan(text: 'Follow some skaters in your area'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Consumer<UserModal>(
                  builder: (context, modal, child) {
                    return ListView.separated(
                      itemCount: items.length,
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SuggestedProfileCard(
                              imagePath: item['imagePath'],
                              profileName: item['profileName'],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 1.0),
                              child: item['following'] == true ? FollowButton() : FollowingButton()
                            )
                          ]
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 29),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
