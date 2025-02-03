import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/components/atoms/drag_bar.dart';
import 'package:test_olliefy/components/atoms/challenges_banner.dart';

class SearchPageContent extends StatelessWidget {
  final ScrollController scrollController;

  const SearchPageContent({Key? key, required this.scrollController}) : super(key: key);

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
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Text(
                  'Search',
                  style: TextsStyles.heading2Bold(),
                ),
              )
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
              child: Container()
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
