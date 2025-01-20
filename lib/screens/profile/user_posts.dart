import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';

class UserPosts extends StatefulWidget {
  @override
  _UserPostsState createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {

  final List<Map<String, dynamic>> items = [
      {'thumbnail': '1.jpeg', 'type': 'image'},
      {'thumbnail': '2.jpeg', 'type': 'event'},
      {'thumbnail': '3.jpeg', 'type': 'video'},
      {'thumbnail': '4.jpeg', 'type': 'video'},
      {'thumbnail': '5.jpeg', 'type': 'video'},
      {'thumbnail': '6.jpeg', 'type': 'event'},
    ];

    final imageIcon = 'assets/profile_page/icons/image_icon.svg';
    final videoIcon = 'assets/profile_page/icons/video_icon.svg';
    final eventIcon = 'assets/profile_page/icons/event_icon.svg';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Expanded(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: 0.65,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GridTile(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 158,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: AppColors.primaryGray5,
                            width: 1.0,
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/profile_page/example_posts/${item['thumbnail']}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8.7,
                        right: 8.4,
                        child:  item['type'] == 'image'
                        ? SvgPicture.asset(
                            imageIcon,
                            width: 13.0,
                            height: 13.0,
                          )
                        : item['type'] == 'video'
                          ? SvgPicture.asset(
                              videoIcon,
                              width: 13.0,
                              height: 13.0,
                            )
                        : item['type'] == 'event'
                            ? SvgPicture.asset(
                                eventIcon,
                                width: 13.0,
                                height: 13.0,
                              )
                        : Container(),
                      ),
                    ]
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
