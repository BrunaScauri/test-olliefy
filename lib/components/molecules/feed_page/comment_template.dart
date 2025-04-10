import 'package:flutter/material.dart';

import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class CommentTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfilePicture(
              borderWidth: 40.0,
              borderHeight: 40.0,
              imageWidth: 36.8,
              imageHeight: 36.8,
              imageHorizontalPadding: 1.6,
              imageVerticalPadding: 1.6,
              imagePath: 'assets/profile_page/icons/example_pfp/9.png',
            ),
            SizedBox(width: 8),
            Column(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 320),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Streetslicer', style: FeedStyles.commentUsername()),
                      Text("Wow, you've got some serious skills! 😲🔥Wow, you've got some serious skills! 😲🔥 Wow, you've got some serious skills! 😲🔥Wow, you've got some serious skills! 😲🔥 Wow, you've got some serious skills! 😲🔥Wow, you've got some serious skills! 😲🔥 Wow, you've got some serious skills! 😲🔥Wow, you've got some serious skills! 😲🔥 Wow, you've got some serious skills! 😲🔥Wow, you've got some serious skills! 😲🔥 Wow, you've got some serious skills! 😲🔥Wow, you've got some serious skills! 😲🔥 ", style: TextsStyles.profileDescription(), maxLines: 3,
                        overflow: TextOverflow.ellipsis),
                    ],
                  )
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 320),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("3 weeks ago", style: TextsStyles.profileData()),
                          SizedBox(width: 16),
                          Text("Reply", style: TextsStyles.showMore()),
                        ]
                      ),
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/feed_page/icons/cheer_icon_comments.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 4),
                          Text("56", style: TextsStyles.smallText()),
                        ],
                      )
                    ],
                  )
                ),
              ],
            )
          ],
        )
    );
  }
}
