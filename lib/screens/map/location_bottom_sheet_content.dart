import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/components/atoms/drag_bar.dart';
import 'package:test_olliefy/components/atoms/challenges_banner.dart';
import 'package:test_olliefy/components/molecules/filter_button_row.dart';
import 'package:test_olliefy/components/atoms/title_show_more_header.dart';
import 'package:test_olliefy/components/atoms/title_show_feed_header.dart';
import 'package:test_olliefy/components/molecules/store_item_card.dart';
import 'package:test_olliefy/components/molecules/skateboarding_recently_card.dart';

class LocationBottomSheetContent extends StatelessWidget {
  final ScrollController scrollController;

  const LocationBottomSheetContent({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: CustomScrollView(
      controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 8),
              child: DragBar(),
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: Text(
                'NOW IN',
                style: TextsStyles.spacedGray(),
              ),
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: Text(
                'Barcelona',
                style: TextsStyles.heading2Bold(),
              ),
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: Row(
                children: [
                  Text(
                    '923 Spots',
                    style: TextsStyles.sponsorDate(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(
                      Icons.circle,
                      size: 4,
                    ),
                  ),
                  Text(
                    '236 posts today ',
                    style: TextsStyles.sponsorDate(),
                  ),
                ]
              )
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 16),
              child: FilterButtonRow(searchButton: false),
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 16, right: 16),
              child: ChallengesBanner(),
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: TitleShowFeedHeader(title: 'LAST POSTS'),
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: TitleShowMoreHeader(title: 'SKATEBOARDING RECENTLY'),
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: Column(
                children: [
                  SkateboardingRecentlyCard(imagePath: 'assets/profile_page/icons/example_pfp/9.png', profileName: 'RailRider', timestamp: '20 minutes ago'),
                  SkateboardingRecentlyCard(imagePath: 'assets/profile_page/icons/example_pfp/7.jpeg', profileName: 'Shredmaster', timestamp: '1 hour ago'),
                  SkateboardingRecentlyCard(imagePath: 'assets/profile_page/icons/example_pfp/0.jpeg', profileName: 'Olliewizard', timestamp: '4 hours ago'),
                ]
              )
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: TitleShowMoreHeader(title: 'CHALLENGES'),
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: StoreItemCard(),
            )
          ),
        ],
      ),
    );
  }
}
