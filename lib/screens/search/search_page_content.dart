import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/components/atoms/drag_bar.dart';
import 'package:test_olliefy/components/atoms/recent_searches.dart';
import 'package:test_olliefy/components/atoms/title_show_more_header.dart';
import 'package:test_olliefy/components/atoms/search_page_spots.dart';
import 'package:test_olliefy/components/molecules/search_page_users.dart';
import 'package:test_olliefy/components/atoms/title_show_feed_header.dart';
import 'package:test_olliefy/components/molecules/post_card.dart';

class SearchPageContent extends StatefulWidget {
  final ScrollController scrollController;

  const SearchPageContent({Key? key, required this.scrollController}) : super(key: key);

  @override
  _SearchPageContentState createState() => _SearchPageContentState();
}

class _SearchPageContentState extends State<SearchPageContent> {
  bool _isSearchActive = false;
  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
    _searchFocusNode.addListener(() {
      setState(() {
        _isSearchActive = _searchFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        backgroundColor: AppColors.primaryWhite,
        body: CustomScrollView(
          controller: widget.scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: DragBar(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24, top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Search',
                        style: TextsStyles.heading2Bold(),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      iconSize: 24,
                      color: AppColors.primaryGray30,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: TextFormField(
                  focusNode: _searchFocusNode,
                  onTap: () {
                    setState(() {
                      _isSearchActive = true;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search spots, users or items',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0),
                      borderSide: BorderSide(color: AppColors.primaryGold70),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryGold70, width: 3.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                  onChanged: (value) {
                    print("Search query: $value");
                  },
                ),
              ),
            ),
            ...(!_isSearchActive ? [
              SliverToBoxAdapter(
                child: Text(
                  'RECENT SEARCHES',
                  style: TextsStyles.spacedGray(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 48),
                  child: RecentSearches(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: TitleShowMoreHeader(title: 'SPOTS'),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 48),
                  child: SearchPageSpots(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: TitleShowMoreHeader(title: 'USERS'),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 48),
                  child: Column(
                    children: [
                      SearchPageUsers(imagePath: 'assets/profile_page/icons/example_pfp/9.png', profileName: 'Fakiephenom'),
                      SearchPageUsers(imagePath: 'assets/profile_page/icons/example_pfp/7.jpeg', profileName: 'Dropindynamo'),
                      SearchPageUsers(imagePath: 'assets/profile_page/icons/example_pfp/0.jpeg', profileName: 'Asphaltartist'),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: TitleShowFeedHeader(title: 'LAST POSTS'),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: PostCard(),
                ),
              ),
            ] : [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Container(),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}