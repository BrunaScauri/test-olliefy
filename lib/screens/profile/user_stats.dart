import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';

import 'package:test_olliefy/screens/profile/add_article_on_stats.dart';
import 'package:test_olliefy/components/atoms/user_stats_card_description.dart';

class UserStats extends StatefulWidget {
  @override
  _UserStatsState createState() => _UserStatsState();
}

class _UserStatsState extends State<UserStats> {
  final List<Map<String, String>> items = [
    {'image': '1.jpeg', 'itemName': 'Piled Willms 8.3″X32″ Sk8Mafia Deck', 'itemType': 'Deck',},
    {'image': '2.png', 'itemName': 'Stage 11 Bar Flat Black Standard Independent', 'itemType': 'Truck',},
    {'image': '3.jpeg', 'itemName': 'Friend Of Sk8 Like A Girl Classic Natural 55mm Spitfire', 'itemType': 'Wheels',},
    {'image': '4.png', 'itemName': 'Red Bones Big Balls', 'itemType': 'Bearings',},
    
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 48, bottom: 20),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text('SETUP', style: TextsStyles.spacedGray()),
          //space for the products
          Expanded(
            child: GridView.builder(
            // physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 4,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return GridTile(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //prod image
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: AppColors.primaryGray5,
                              width: 1.0,
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/profile_page/example_stats_items/${item['image']}'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        //prod desc
                        Container(
                          width: 190,
                          height: 90,
                          child: UserStatsCardDescription(
                            itemName: item['itemName'],
                            itemType: item['itemType'],
                          ),
                        ),
                        IconButton(
                          icon: Image.asset('assets/profile_page/icons/pencil_icon.png', width: 18),
                          // iconSize: 20,
                          onPressed: () {
                          },
                        ),
                      ],
                  )
                );
              },
            ),
          ),
          OutlinedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                builder: (BuildContext context) {
                  return AddArticleOnStats();
                },
              );
            },
            style: ButtonStyles.marketplaceButton(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.primaryGray10,
                  size: 20,
                ),
                SizedBox(width: 4),
                RichText(
                  text: TextSpan(
                    style: TextStyles.elevatedButtonText(color: AppColors.primaryGray10),
                    children: [
                      TextSpan(text: 'Add article to setup'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
