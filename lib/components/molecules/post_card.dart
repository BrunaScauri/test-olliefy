import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';

class PostCard extends StatefulWidget {
  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {

  final List<Map<String, dynamic>> items = [
      {'thumbnail': '1.gif', 'type': 'video', 'profilePicture': '0.jpeg', 'username': 'Darkcolosus'},
      {'thumbnail': '2.gif', 'type': 'video', 'profilePicture': '5.jpeg', 'username': 'Analissuppini'},
      {'thumbnail': '3.gif', 'type': 'video', 'profilePicture': '9.png', 'username': 'Lodozzz'},
      {'thumbnail': '1.gif', 'type': 'video', 'profilePicture': '0.jpeg', 'username': 'Darkcolosus'},
      {'thumbnail': '2.gif', 'type': 'video', 'profilePicture': '5.jpeg', 'username': 'Analissuppini'},
      {'thumbnail': '3.gif', 'type': 'video', 'profilePicture': '9.png', 'username': 'Lodozzz'},
      {'thumbnail': '1.gif', 'type': 'video', 'profilePicture': '0.jpeg', 'username': 'Darkcolosus'},
      {'thumbnail': '2.gif', 'type': 'video', 'profilePicture': '5.jpeg', 'username': 'Analissuppini'},
      {'thumbnail': '3.gif', 'type': 'video', 'profilePicture': '9.png', 'username': 'Lodozzz'},
    ];

    final videoIcon = 'assets/profile_page/icons/video_icon.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryWhite,
      height: 285,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          'assets/map_page/posts/${item['thumbnail']}',
                          width: 136,
                          height: 242,
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
                Row(
                  children: [
                    ProfilePicture(
                      borderWidth: 24, borderHeight: 24, imageWidth: 22.08, imageHeight: 22.08, imageHorizontalPadding: 0.96, imageVerticalPadding: 0.96, imagePath: 'assets/profile_page/icons/example_pfp/${item['profilePicture']}', imageFit: BoxFit.cover
                    ),
                    SizedBox(width: 8),
                    Text(item['username'], style: TextsStyles.postsProfileName()),
                  ]
                )
              ]
            )
          );
        },
      ),
    );
  }
}
