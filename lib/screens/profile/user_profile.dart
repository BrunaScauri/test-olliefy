import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/borders.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/route/page_slide_animation.dart';

import 'package:test_olliefy/screens/profile/user_posts.dart';
import 'package:test_olliefy/screens/profile/user_store.dart';
import 'package:test_olliefy/screens/profile/user_stats.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Center(
          child: Container(
          constraints: BoxConstraints(maxWidth: 370),
          child: Column(
            children: [
              //Profile name, settings, favorites, notifications and chat row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                    children: [
                      RichText(
                          text:TextSpan(style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.primaryBlack), children: [
                            TextSpan(text:'Allramps'),
                          ])
                        ),
                      ]
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Image.asset('assets/profile_page/icons/settings_icon.png', width: 18),
                          iconSize: 18,
                          onPressed: () {
                            // Navigator.of(context).push(
                            //   pageSlideAnimation(const MainScreen())
                            // );
                          }
                        ),
                        IconButton(
                          icon: Image.asset('assets/profile_page/icons/favorites_icon.png', width: 18),
                          iconSize: 18,
                          onPressed: () {
                            // Navigator.of(context).push(
                            //   pageSlideAnimation(const MainScreen())
                            // );
                          }
                        ),
                        IconButton(
                          icon: Badge.count(
                            count: 1,
                            offset: Offset(05.0, -12.0),
                            child: Image.asset('assets/profile_page/icons/notifications_icon.png', width: 18),
                          ),
                          iconSize: 18,
                          onPressed: () {
                            // Navigator.of(context).push(
                            //   pageSlideAnimation(const MainScreen())
                            // );
                          }
                        ),
                        IconButton(
                          icon: Badge.count(
                            count: 5,
                            offset: Offset(09.0, -12.0),
                            child: Image.asset('assets/profile_page/icons/chat_icon.png', width: 18),
                          ),
                          iconSize: 18,
                          onPressed: () {
                            // Navigator.of(context).push(
                            //   pageSlideAnimation(const MainScreen())
                            // );
                          }
                        ),
                      ]
                    )
                  ]
                ),
              ),
              //profile picture, followers, following and posts' row
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: AppColors.primaryWhite,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primaryGray30,
                                    spreadRadius: -8,
                                    blurRadius: 15.0,
                                    offset: Offset(5, 10),
                                  )
                                ]
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.2, vertical: 3.2),
                              child: Container(
                                width: 73.6,
                                height: 73.6,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/profile_page/icons/example_profile_picture_icon.png'),
                                    fit: BoxFit.fill,
                                  )
                                )
                              )
                            )
                          ]
                        ),
                      ]
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 20.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              RichText(
                                text:TextSpan(style: TextsStyles.profileDataBold(), children: [
                                  TextSpan(text:'9,200'),
                                ])
                              ),  
                              RichText(
                                text:TextSpan(style: TextsStyles.profileData(), children: [
                                  TextSpan(text:'Followers'),
                                ])
                              ),  
                            ]
                          ),
                          SizedBox(width: 37),
                          Column(
                            children: [
                              RichText(
                                text:TextSpan(style: TextsStyles.profileDataBold(), children: [
                                  TextSpan(text:'43'),
                                ])
                              ),  
                              RichText(
                                text:TextSpan(style: TextsStyles.profileData(), children: [
                                  TextSpan(text:'Following'),
                                ])
                              ),  
                            ]
                          ),
                          SizedBox(width: 37),
                          Column(
                            children: [
                              RichText(
                                text:TextSpan(style: TextsStyles.profileDataBold(), children: [
                                  TextSpan(text:'88'),
                                ])
                              ),  
                              RichText(
                                text:TextSpan(style: TextsStyles.profileData(), children: [
                                  TextSpan(text:'Posts'),
                                ])
                              ),  
                            ]
                          ),
                        ]
                      )
                    )
                    
                  ]
                )
              ),
    );
  }
}
