import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/components/atoms/user_store_item_card_description.dart';
import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';

class SearchPageSpots extends StatefulWidget {
  @override
  _SearchPageSpotsState createState() => _SearchPageSpotsState();
}

class _SearchPageSpotsState extends State<SearchPageSpots> {

  final List<Map<String, String>> items = [
    {'image': '1.png', 'spotName': 'Poblenou Skatepark'},
    {'image': '2.png', 'spotName': 'Universitat de Barcelona'},
    {'image': '3.png', 'spotName': 'Sants Estació'},
    {'image': '4.png', 'spotName': 'Parc del Fòrum'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: GridView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 163 / 145,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            width: 163,
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        'assets/map_page/spots/${item['image']}',
                        width: 163,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 16.0,
                      left: 0,
                      right: 0,
                      child: Text(
                        item['spotName'] ?? '',
                        textAlign: TextAlign.center,
                        style: ChallengesStyles.challengePrize(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}