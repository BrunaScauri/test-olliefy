import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/route/slide_incoming_from_bottom.dart';

import 'package:test_olliefy/components/molecules/markerplace_filter_button.dart';
import 'package:test_olliefy/screens/marketplace/sell_in_the_marketplace.dart';
import 'package:test_olliefy/screens/profile/favorites/favorites_marketplace.dart';

class Marketplace extends StatefulWidget {
  @override
  _MarketplaceState createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers:[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        hintText: 'Search Articles',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.0),
                          borderSide: BorderSide(color: AppColors.primaryGold70),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryGold70, width: 3.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      ),
                      onChanged: (value) {
                        print("Search query: $value");
                      },
                    ),
                  ),
                  SizedBox(width: 22),
                  IconButton(
                    icon: Image.asset('assets/map_page/icons/filter_icon.png', width: 18),
                    iconSize: 24,
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: MarketplaceFilterButtonRow(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    SlideIncomingFromBottom(exitPage:Marketplace(), enterPage: SellInTheMarketplace())
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
                          TextSpan(text: 'Sell in the marketplace'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: FavoritesMarketplace(),
            ),
          )
        ]
      ),
    );
  }
}