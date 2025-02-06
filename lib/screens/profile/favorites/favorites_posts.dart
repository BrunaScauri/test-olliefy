import 'package:flutter/material.dart';
import 'package:test_olliefy/components/molecules/favorite_posts_card.dart';

class FavoritesPosts extends StatefulWidget {
  @override
  _FavoritesPostsState createState() => _FavoritesPostsState();
}

class _FavoritesPostsState extends State<FavoritesPosts> {
  final List<Map<String, dynamic>> items = [
    {'thumbnail': '1.jpeg', 'type': 'image'},
    {'thumbnail': '2.jpeg', 'type': 'event'},
    {'thumbnail': '3.jpeg', 'type': 'video'},
    {'thumbnail': '4.jpeg', 'type': 'video'},
    {'thumbnail': '5.jpeg', 'type': 'video'},
    {'thumbnail': '6.jpeg', 'type': 'event'},
  ];

  @override
  Widget build(BuildContext context) {
    const cardWidth = 170.0;
    const cardHeight = 360.0;

    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = (screenWidth / (cardWidth + 16)).floor();
    final childAspectRatio = cardWidth / cardHeight;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 28),
      child: ListView(
        children: [
          SizedBox(
            height: cardHeight * (items.length / crossAxisCount).ceil(),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: childAspectRatio,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];


                return FavoritePostsCard(
                  imagePath: 'assets/profile_page/example_posts/${item['thumbnail']}',
                  profilePicturePath: 'assets/profile_page/icons/example_pfp/0.jpeg',
                  profileName: 'StreetDestroyer',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

