import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:test_olliefy/utils/colors.dart';

class EventCards extends StatefulWidget {
  @override
  _EventCardsState createState() => _EventCardsState();
}

class _EventCardsState extends State<EventCards> {

  final List<Map<String, dynamic>> items = [
      {'thumbnail': '6.jpeg', 'type': 'event'},
      {'thumbnail': '2.jpeg', 'type': 'event'},
      {'thumbnail': '7.jpeg', 'type': 'event'},
      {'thumbnail': '6.jpeg', 'type': 'event'},
      {'thumbnail': '2.jpeg', 'type': 'event'},
      {'thumbnail': '7.jpeg', 'type': 'event'},
      {'thumbnail': '6.jpeg', 'type': 'event'},
      {'thumbnail': '2.jpeg', 'type': 'event'},
      {'thumbnail': '7.jpeg', 'type': 'event'},
      {'thumbnail': '6.jpeg', 'type': 'event'},
      {'thumbnail': '2.jpeg', 'type': 'event'},
      {'thumbnail': '7.jpeg', 'type': 'event'},
      {'thumbnail': '6.jpeg', 'type': 'event'},
      {'thumbnail': '2.jpeg', 'type': 'event'},
      {'thumbnail': '7.jpeg', 'type': 'event'},
      {'thumbnail': '6.jpeg', 'type': 'event'},
      {'thumbnail': '2.jpeg', 'type': 'event'},
      {'thumbnail': '7.jpeg', 'type': 'event'},
    ];

    final eventIcon = 'assets/profile_page/icons/event_icon.svg';
    final double cardHeight = 242;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: SizedBox(
        height: cardHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal, 
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: GridTile(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: cardHeight,
                          width: 136,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: AppColors.primaryGray5,
                              width: 1.0,
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/profile_page/example_posts/${item['thumbnail']}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8.7,
                          right: 8.4,
                          child: item['type'] == 'event'
                          ? SvgPicture.asset(
                              eventIcon,
                              width: 20.0,
                              height: 20.0,
                            )
                          : Container(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
