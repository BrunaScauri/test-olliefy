import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/screens/profile/favorites/favorites_posts.dart';
import 'package:test_olliefy/screens/search/example_search_users.dart';
import 'package:test_olliefy/screens/profile/favorites/favorites_spots.dart';

class SearchQueryPage extends StatefulWidget {
	@override
	_SearchQueryPageState createState() => _SearchQueryPageState();
}

class _SearchQueryPageState extends State<SearchQueryPage> {
  late TextEditingController _searchController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(() {
      setState(() {});
    });
  }

	@override
	Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        backgroundColor: AppColors.primaryWhite,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24, top: 40),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.west),
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Image.asset('assets/map_page/icons/clean_query.png'),
                            onPressed: () {
                              _searchController.clear();
                            },
                          ),
                          hintText: 'Search spots or items',
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
                    SizedBox(width: 22),
                    IconButton(
                      icon: Image.asset('assets/map_page/icons/filter_icon.png', width: 18),
                      iconSize: 24,
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 28),
                child: DefaultTabController(
                  initialIndex: 0,
                  length: 3,
                  child: Column(
                    children: [
                      TabBar(
                        onTap: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        tabs: [
                          Tab(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Posts'),
                            ),
                          ),
                          Tab(text: 'Users'),
                          Tab(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text('Spots'),
                            ),
                          ),
                        ],
                        labelColor: AppColors.primaryBlack,
                        unselectedLabelColor: AppColors.primaryGray30,
                        indicatorColor: AppColors.primaryGold70,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 2.0,
                        labelStyle: TextsStyles.profileDataBold(),
                        unselectedLabelStyle: TextsStyles.settingsSubtitle(),
                      ),
                      SizedBox(height: 16),
                      AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: IndexedStack(
                          index: currentIndex,
                          children: [
                            FavoritesPosts(),
                            ExampleSearchUsers(),
                            Column(children: [
                              FavoritesSpots(),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]
        )
      ),
    );
  }
}