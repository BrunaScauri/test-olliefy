import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';

import 'package:test_olliefy/components/atoms/user_store_item_card_description.dart';
import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';

class FavoritesMarketplace extends StatefulWidget {
  @override
  _FavoritesMarketplaceState createState() => _FavoritesMarketplaceState();
}

class _FavoritesMarketplaceState extends State<FavoritesMarketplace> {

  final List<Map<String, String>> items = [
    {'image': '1.jpeg', 'itemPrice': '20€', 'itemName': 'DC Court Ssk New', 'itemType': 'Sneakers',},
    {'image': '2.jpeg', 'itemPrice': '90€', 'itemName': 'Trucks Skate Thunders ', 'itemType': 'Polished and this should be elipsis',},
    {'image': '3.jpeg', 'itemPrice': '22€', 'itemName': 'Wheels Skate Ojs', 'itemType': 'New',},
    {'image': '4.jpeg', 'itemPrice': '25€', 'itemName': 'Wheels Element', 'itemType': 'New',},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 30.0,
                childAspectRatio: 0.65,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: AppColors.primaryGray5,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/profile_page/example_store_items/${item['image']}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8.7,
                              right: 8.4,
                              child: ProfilePicture(borderWidth: 24.0, borderHeight: 24.0, imageWidth: 22.5, imageHeight: 22.5, imageHorizontalPadding: 0.9, imageVerticalPadding: 0.9, imagePath: 'assets/profile_page/icons/example_pfp/9.png'),
                            ),
                          ]
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
          ),
        )
      ),
    );
  }
}

