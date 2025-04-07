import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/screens/profile/favorites/favorites_spots.dart';
import 'package:test_olliefy/screens/profile/favorites/favorites_marketplace.dart';
import 'package:test_olliefy/screens/profile/favorites/favorites_posts.dart';

class UserFavorites extends StatefulWidget {
	@override
	_UserFavoritesState createState() => _UserFavoritesState();
}

class _UserFavoritesState extends State<UserFavorites> {
  int currentIndex = 0;

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
              title: Text('Favorites', style: TextsStyles.profileDataBold()),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 370),
            child: Column(
              children: [
                DefaultTabController(
                  initialIndex: 0,
                  length: 3,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
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
                      SizedBox(height: 28),
                      Container(
                        child: TabBar(
                          onTap: (index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          tabs: [
                            Tab(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Spots'),
                              ),
                            ),
                            Tab(text: 'Marketplace'),
                            Tab(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text('Posts'),
                              ),
                            ),
                          ],
                          indicatorColor: AppColors.primaryGold70,
                          labelPadding: EdgeInsets.zero,
                          indicatorPadding: currentIndex == 0
                              ? EdgeInsets.only(right: 75.0)
                              : currentIndex == 1
                                  ? EdgeInsets.zero
                                  : currentIndex == 2
                                      ? EdgeInsets.only(left: 60.0)
                                      : EdgeInsets.zero,
                          labelColor: AppColors.primaryBlack,
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ),
                      AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: IndexedStack(
                          index: currentIndex,
                          children: [
                            FavoritesSpots(),
                            FavoritesMarketplace(),
                            FavoritesPosts(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}