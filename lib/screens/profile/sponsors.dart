import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/components/molecules/sponsor_card.dart';

class SponsorsReceived extends StatefulWidget {
	@override
	_SponsorsReceivedState createState() => _SponsorsReceivedState();
}

class _SponsorsReceivedState extends State<SponsorsReceived> {
  final List<Map<String, dynamic>> items = [
    {'imagePath': 'assets/profile_page/icons/example_pfp/0.jpeg', 'profileName': 'sk8_legend', 'sponsorDate': 'This is an example of a really long sponsor date'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/1.jpeg', 'profileName': 'pavementripper', 'sponsorDate': 'Subscribed for 1 month.'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/2.jpeg', 'profileName': 'trickwizard', 'sponsorDate': 'Make a one-time contribution of 45€'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/3.jpeg', 'profileName': 'board_beast', 'sponsorDate': 'Make a one-time contribution of 2€s'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/0.jpeg', 'profileName': 'sk8_legend', 'sponsorDate': 'Subscribed for 2 months.'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/1.jpeg', 'profileName': 'pavementripper', 'sponsorDate': 'Subscribed for 1 month.'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/2.jpeg', 'profileName': 'trickwizard', 'sponsorDate': 'Make a one-time contribution of 45€'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/3.jpeg', 'profileName': 'board_beast', 'sponsorDate': 'Make a one-time contribution of 2€s'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/0.jpeg', 'profileName': 'sk8_legend', 'sponsorDate': 'Subscribed for 2 months.'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/1.jpeg', 'profileName': 'pavementripper', 'sponsorDate': 'Subscribed for 1 month.'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/2.jpeg', 'profileName': 'trickwizard', 'sponsorDate': 'Make a one-time contribution of 45€'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/3.jpeg', 'profileName': 'board_beast', 'sponsorDate': 'Make a one-time contribution of 2€s'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/0.jpeg', 'profileName': 'sk8_legend', 'sponsorDate': 'Subscribed for 2 months.'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/1.jpeg', 'profileName': 'pavementripper', 'sponsorDate': 'Subscribed for 1 month.'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/2.jpeg', 'profileName': 'trickwizard', 'sponsorDate': 'Make a one-time contribution of 45€'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/3.jpeg', 'profileName': 'board_beast', 'sponsorDate': 'Make a one-time contribution of 2€s'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/0.jpeg', 'profileName': 'sk8_legend', 'sponsorDate': 'Subscribed for 2 months.'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/1.jpeg', 'profileName': 'pavementripper', 'sponsorDate': 'Subscribed for 1 month.'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/2.jpeg', 'profileName': 'trickwizard', 'sponsorDate': 'Make a one-time contribution of 45€'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/3.jpeg', 'profileName': 'board_beast', 'sponsorDate': 'Make a one-time contribution of 2€s'},
  ];

	@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Container(
          constraints: BoxConstraints(maxWidth: 370),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: AppBar(
              title: Text('Sponsors received', style: TextsStyles.profileDataBold()),
              backgroundColor: AppColors.primaryWhite,
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
                  return SponsorCard(
                    imagePath: item['imagePath'],
                    profileName: item['profileName'],
                    sponsorDate: item['sponsorDate'],
                  );
                },
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 48),
              ),
            )
          ),
        ),
      );
  }
}

class SponsorsGiven extends StatefulWidget {
	@override
	_SponsorsGivenState createState() => _SponsorsGivenState();
}

class _SponsorsGivenState extends State<SponsorsGiven> {
  final List<Map<String, dynamic>> items = [
    {'imagePath': 'assets/profile_page/icons/example_pfp/4.jpeg', 'profileName': 'Skatenfly', 'sponsorDate': 'This is an example of a really long sponsor date'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/5.jpeg', 'profileName': 'Theboss', 'sponsorDate': 'Subscribed for 2 months.'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/6.jpeg', 'profileName': 'Latinotricks', 'sponsorDate': 'Subscribed for 2 months.'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/7.jpeg', 'profileName': 'Ensayo_y_error', 'sponsorDate': 'Make a one-time contribution of 45€'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/8.jpeg', 'profileName': 'Danielsoto', 'sponsorDate': 'Make a one-time contribution of 2€'},
  ];

	@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 370),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: AppBar(
                title: Text('Sponsors given', style: TextsStyles.profileDataBold()),
                backgroundColor: AppColors.primaryWhite,
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
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SponsorCard(
                          imagePath: item['imagePath'],
                          profileName: item['profileName'],
                          sponsorDate: item['sponsorDate'],
                        ),
                        if (item['sponsorDate'].contains('months')) 
                        GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 48,
                            height: 48,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextsStyles.sponsorSubscription(color: AppColors.feedbackOrError),
                                children: [
                                  TextSpan(text: 'Cancel'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (item['sponsorDate'].contains('one-time')) 
                        GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 48,
                            height: 48,
                            child: RichText(textAlign: TextAlign.center, text:TextSpan(style: TextsStyles.sponsorSubscription(color: AppColors.primaryGold70), children: [
                                TextSpan(text:'Renew'),
                              ])
                            ),
                          ),
                        )
                      ]
                    );
                  },
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 48),
              ),
            )
          ),
        ),
    );
  }
}