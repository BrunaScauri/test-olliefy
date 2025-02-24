import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:test_olliefy/screens/map/place.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/components/atoms/drag_bar.dart';
import 'package:test_olliefy/components/molecules/filter_button_row.dart';
import 'package:test_olliefy/components/atoms/title_show_more_header.dart';
import 'package:test_olliefy/components/atoms/title_show_feed_header.dart';
import 'package:test_olliefy/components/molecules/post_card.dart';
import 'package:test_olliefy/components/molecules/skateboarding_recently_card.dart';
import 'package:test_olliefy/components/atoms/challenges_card.dart';
import 'package:test_olliefy/components/molecules/challenges_banner.dart';
import 'package:test_olliefy/components/molecules/side_scroll_store_item_card.dart';
import 'package:test_olliefy/components/atoms/location_condition.dart';

class MapDetailsPage extends StatelessWidget {
  final Place place;

  const MapDetailsPage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: DragBar(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'NOW IN',
              style: TextsStyles.spacedGray(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              place.name,
              style: TextsStyles.heading2Bold(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16),
            child: LocationCondition(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16),
            child: FilterButtonRow(searchButton: false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: TitleShowFeedHeader(title: 'LAST POSTS'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: PostCard(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: TitleShowMoreHeader(title: 'SKATEBOARDING RECENTLY'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              children: [
                SkateboardingRecentlyCard(imagePath: 'assets/profile_page/icons/example_pfp/9.png', profileName: 'RailRider', timestamp: '20 minutes ago'),
                SkateboardingRecentlyCard(imagePath: 'assets/profile_page/icons/example_pfp/7.jpeg', profileName: 'Shredmaster', timestamp: '1 hour ago'),
                SkateboardingRecentlyCard(imagePath: 'assets/profile_page/icons/example_pfp/0.jpeg', profileName: 'Olliewizard', timestamp: '4 hours ago'),
              ]
            )
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: TitleShowMoreHeader(title: 'CHALLENGES'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              children: [
                ChallengesCard(imagePath:'assets/profile_page/icons/example_sponsor_image.png', profileName: 'Spitfire' , challengeName: 'Insane', activityDate:'1 hour ago' ),
                SizedBox(height: 24),
                ChallengesBanner(
                  imagePath:'assets/profile_page/icons/example_sponsor_image.png', profileName: 'Spitfire', 
                  challengeName: 'Insane',
                  challengeSponsor: 'Spitfire',
                  challengeDescription: 'Jump over an obstacle in the most creative way you can think of.',
                  challengePrize: '1st Prize 100€'
                ),
              ]
            )
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: TitleShowMoreHeader(title: 'SELLERS NEARBY'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SideScrollStoreItemCard(),
          ),
        ],
      ),
    );
  }
}