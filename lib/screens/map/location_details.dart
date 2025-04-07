import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/screens/map/place.dart';
import 'package:test_olliefy/components/atoms/drag_bar.dart';
import 'package:test_olliefy/components/molecules/filter_button_row_line_break.dart';
import 'package:test_olliefy/components/atoms/title_show_more_header.dart';
import 'package:test_olliefy/components/atoms/title_show_feed_header.dart';
import 'package:test_olliefy/components/molecules/post_card.dart';
import 'package:test_olliefy/components/molecules/skateboarding_recently_card.dart';
import 'package:test_olliefy/components/atoms/challenges_card.dart';
import 'package:test_olliefy/components/molecules/challenges_banner.dart';
import 'package:test_olliefy/components/molecules/side_scroll_store_item_card.dart';
import 'package:test_olliefy/components/atoms/location_condition.dart';

class LocationDetails extends StatelessWidget {
  final Place place;

  const LocationDetails({Key? key, required this.place}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 60),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 16, left: 16),
              child: DragBar(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 16, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'NOW IN',
                    style: TextsStyles.spacedGray(),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    iconSize: 24,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ]
              )
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 16, left: 16),
              child: Text(
                place.name,
                style: TextsStyles.heading2Bold(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
              child: LocationCondition(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: FilterButtonRowLineBreak(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24, right: 16, left: 16),
              child: TitleShowFeedHeader(title: 'LAST POSTS'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40, right: 16, left: 16),
              child: PostCard(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2, right: 16, left: 16),
              child: TitleShowMoreHeader(title: 'SKATEBOARDING RECENTLY'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40, right: 16, left: 16),
              child: Column(
                children: [
                  SkateboardingRecentlyCard(
                    imagePath:
                        'assets/profile_page/icons/example_pfp/9.png',
                    profileName: 'RailRider',
                    timestamp: '20 minutes ago',
                  ),
                  SkateboardingRecentlyCard(
                    imagePath:
                        'assets/profile_page/icons/example_pfp/7.jpeg',
                    profileName: 'Shredmaster',
                    timestamp: '1 hour ago',
                  ),
                  SkateboardingRecentlyCard(
                    imagePath:
                        'assets/profile_page/icons/example_pfp/0.jpeg',
                    profileName: 'Olliewizard',
                    timestamp: '4 hours ago',
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24, right: 16, left: 16),
              child: TitleShowMoreHeader(title: 'CHALLENGES'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40, right: 16, left: 16),
              child: Column(
                children: [
                  ChallengesCard(
                    imagePath:
                        'assets/profile_page/icons/example_sponsor_image.png',
                    profileName: 'Spitfire',
                    challengeName: 'Insane',
                    activityDate: '1 hour ago',
                  ),
                  SizedBox(height: 24),
                  ChallengesBanner(
                    imagePath:
                        'assets/profile_page/icons/example_sponsor_image.png',
                    profileName: 'Spitfire',
                    challengeName: 'Insane',
                    challengeSponsor: 'Spitfire',
                    challengeDescription:
                        'Jump over an obstacle in the most creative way you can think of.',
                    challengePrize: '1st Prize 100€',
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24, right: 16, left: 16),
              child: TitleShowMoreHeader(title: 'SELLERS NEARBY'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40, right: 16, left: 16),
              child: SideScrollStoreItemCard(),
            ),
          ),
        ],
      )
    );
  }
}