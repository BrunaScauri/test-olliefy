import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/route/page_slide_animation.dart';

import 'package:test_olliefy/components/atoms/follow_button.dart';
import 'package:test_olliefy/components/atoms/profile_name.dart';
import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';
import 'package:test_olliefy/screens/marketplace/shipping_details';

class ExampleArticlePage extends StatefulWidget {
  @override
  _ExampleArticlePageState createState() => _ExampleArticlePageState();
}

class _ExampleArticlePageState extends State<ExampleArticlePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0),
          child: AppBar(
            backgroundColor: AppColors.primaryWhite,
            actions: [
              IconButton(
                icon: ImageIcon(
                  AssetImage('assets/marketplace_page/icons/favorite_icon.png'),
                ),
                onPressed: () {
                },
              ),
              IconButton(
                icon: ImageIcon(
                  AssetImage('assets/marketplace_page/icons/share_icon.png'),
                ),
                onPressed: () {
                },
              ),
            ],
          ),
        ),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 375,
                          child: PageView.builder(
                            itemCount: 3, //number of available pictures
                            onPageChanged: (index) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              return Image.asset(
                                'assets/profile_page/example_store_items/1.jpeg',
                                fit: BoxFit.fitWidth,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(3, //number of available pictures
                              (index) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 8.0),
                                width: 8.0,
                                height: 8.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index == _currentIndex ? AppColors.primaryGold60 : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('NEW', style: TextsStyles.spacedGray()),
                          Text('20€', style: TextsStyles.blackSemiboldLarge()),
                          Text('DC Court Ssk New Sneakers', style: MarketplaceStyles.articleTitle()),
                          SizedBox(height: 16.0),
                          Text('Designed for skate lovers who seek comfort and style while mastering the streets. Made from soft and breathable cotton.', style: TextsStyles.profileDescription()),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 24),
                            child: Text('PUBLISHED BY', style: TextsStyles.spacedGray()),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 26),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ProfilePicture(borderWidth: 40.0, borderHeight: 40.0, imageWidth: 36.8, imageHeight: 36.8, imageHorizontalPadding: 1.6, imageVerticalPadding: 1.6, imagePath: 'assets/profile_page/icons/example_pfp/9.jpeg'),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Turboquist', style: TextsStyles.profileDescription()),
                                          Text('30 minutes ago', style: TextsStyles.profileData()),
                                        ]
                                      )
                                    ),
                                  ]
                                ),
                                FollowButton(),
                              ]  
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                pageSlideAnimation(ShippingDetails())
                              );
                            },
                            style: ButtonStyles.elevatedButton(
                            backgroundColor: AppColors.primaryGold60),
                            child: Text('Buy', style: TextStyles.elevatedButtonText(color: AppColors.primaryBlack),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          GestureDetector(
                            onTap: () {
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/marketplace_page/icons/send_a_message_icon.png',
                                  width: 20.0,
                                  height: 20.0,
                                ),
                                SizedBox(width: 8.0),
                                Text('Send a message', style: UserStoreStyles.sendAMessage()),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}