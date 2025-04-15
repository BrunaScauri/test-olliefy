import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';

class PostCardVertical extends StatefulWidget {
  @override
  _PostCardVerticalState createState() => _PostCardVerticalState();
}

class _PostCardVerticalState extends State<PostCardVertical> {

  final List<Map<String, dynamic>> items = [
      {'thumbnail': '1.gif', 'type': 'video', 'description': 'Sliding through the plaza, conquering', 'profilePicture': '0.jpeg', 'username': 'Darkcolosus'},
      {'thumbnail': '2.gif', 'type': 'video', 'description': 'Rhymes flowing like a perfect ollie', 'profilePicture': '5.jpeg', 'username': 'Analissuppini'},
      {'thumbnail': '3.gif', 'type': 'video', 'description': 'Urban culture at its finest', 'profilePicture': '9.png', 'username': 'Lodozzz'},
      {'thumbnail': '1.gif', 'type': 'video', 'description': 'Between flips and ollies, this plaza is my ', 'profilePicture': '0.jpeg', 'username': 'Darkcolosus'},
      {'thumbnail': '2.gif', 'type': 'video', 'description': 'Urban culture at its finest', 'profilePicture': '5.jpeg', 'username': 'Analissuppini'},
      {'thumbnail': '3.gif', 'type': 'video', 'description': 'Exploring the urban vibes at the plaza  ...', 'profilePicture': '9.png', 'username': 'Lodozzz'},
      {'thumbnail': '1.gif', 'type': 'video', 'description': 'Between flips and ollies, this plaza is my ', 'profilePicture': '0.jpeg', 'username': 'Darkcolosus'},
      {'thumbnail': '2.gif', 'type': 'video', 'description': 'Between flips and ollies, this plaza is my ', 'profilePicture': '5.jpeg', 'username': 'Analissuppini'},
      {'thumbnail': '3.gif', 'type': 'video', 'description': 'Between flips and ollies, this plaza is my ', 'profilePicture': '9.png', 'username': 'Lodozzz'},
    ];

    final videoIcon = 'assets/profile_page/icons/video_icon.svg';

  Widget _buildPostCard(Map<String, dynamic> item) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    'assets/map_page/posts/${item['thumbnail']}',
                    width: 160,
                    height: 290,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8.7,
                  right: 8.4,
                  child: SvgPicture.asset(
                    videoIcon,
                    width: 16.0,
                    height: 16.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: 163,
            child: Text(
              item['description'],
              style: UserNotifsStyles.activity(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              ProfilePicture(
                borderWidth: 24,
                borderHeight: 24,
                imageWidth: 22.08,
                imageHeight: 22.08,
                imageHorizontalPadding: 0.96,
                imageVerticalPadding: 0.96,
                imagePath:
                    'assets/profile_page/icons/example_pfp/${item['profilePicture']}',
                imageFit: BoxFit.cover,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  item['username'],
                  style: TextsStyles.postsProfileName(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int rowCount = (items.length / 2).ceil();

    return SingleChildScrollView(
      child: Column(
        children: List.generate(rowCount, (rowIndex) {
          int firstIndex = rowIndex * 2;
          int secondIndex = firstIndex + 1;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPostCard(items[firstIndex]),
              SizedBox(width: 8),
              secondIndex < items.length
                  ? _buildPostCard(items[secondIndex])
                  : Expanded(child: Container()),
            ],
          );
        }),
      ),
    );
  }
}
