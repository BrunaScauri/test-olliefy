import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';

import 'package:test_olliefy/components/atoms/user_store_item_card_description.dart';
import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';

class SideScrollStoreItemCard extends StatefulWidget {
  @override
  _SideScrollStoreItemCardState createState() => _SideScrollStoreItemCardState();
}

class _SideScrollStoreItemCardState extends State<SideScrollStoreItemCard> {

final List<Map<String, String>> items = [
    {'image': '1.jpeg', 'itemPrice': '20€', 'itemName': 'DC Court Ssk New', 'itemType': 'Sneakers',},
    {'image': '2.jpeg', 'itemPrice': '90€', 'itemName': 'Trucks Skate Thunders ', 'itemType': 'Polished and this should be elipsis',},
    {'image': '3.jpeg', 'itemPrice': '22€', 'itemName': 'Wheels Skate Ojs', 'itemType': 'New',},
    {'image': '4.jpeg', 'itemPrice': '25€', 'itemName': 'Wheels Element', 'itemType': 'New',},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 242,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 136,
              height: 242,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(4, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: AppColors.primaryGray5,
                  width: 0.8,
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                        child: Image.asset(
                          'assets/profile_page/example_store_items/${item['image']}',
                          width: 136,
                          height: 121,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8.7,
                        right: 8.4,
                        child: ProfilePicture(
                          borderWidth: 24.0,
                          borderHeight: 24.0,
                          imageWidth: 22.5,
                          imageHeight: 22.5,
                          imageHorizontalPadding: 0.9,
                          imageVerticalPadding: 0.9,
                          imagePath: 'assets/profile_page/icons/example_pfp/9.png',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: UserStoreItemCardDescription(
                      itemPrice: item['itemPrice'],
                      itemName: item['itemName'],
                      itemType: item['itemType'],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}