import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/components/atoms/drag_bar.dart';
import 'package:test_olliefy/components/atoms/challenges_banner.dart';

class LocationBottomSheetContent extends StatelessWidget {
  final ScrollController scrollController;

  const LocationBottomSheetContent({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
            padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'NOW IN',
                style: TextsStyles.spacedGray(),
              ),
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Barcelona',
                style: TextsStyles.heading2Bold(),
              ),
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
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
            padding: const EdgeInsets.only(bottom: 40),
              child: ChallengesBanner(),
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'LAST POSTS',
                style: TextsStyles.spacedGray(),
              ),
            )
          ),
        ],
      ),
    );
  }
}
