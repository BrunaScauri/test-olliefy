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
                            //   pageSlideAnimation(const Settings())
                            // );
                          }
                        ),
                        IconButton(
                          icon: Image.asset('assets/profile_page/icons/favorites_icon.png', width: 18),
                          iconSize: 18,
                          onPressed: () {
                            // Navigator.of(context).push(
                            //   pageSlideAnimation(const Favorites())
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
                            //   pageSlideAnimation(const Notifications())
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
                            //   pageSlideAnimation(const Chat())
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
                            CustomBorders.profilePictureBorder(width: 80.0, height: 80.0),
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
              //profile description, optional link container and optional sponsor rows
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Column(
                  children: [
                    SizedBox(width: 60),
                    RichText(
                      text: TextSpan(style: TextsStyles.profileDescription(), children: [
                        TextSpan(text:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi varius lorem eu ultrices maximus. Nulla id feugiat nisi, ac varius nisi. Ut ut enim et lacus tempus ullamcorper molestie ut enim. Sed interdum vehicula felis, nec vestibulum turpis accumsan vitae. Etiam consectetur sapien eget eros tincidunt'),
                      ])
                    ),
                    //profile link
                    Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Row(
                        children: [
                          ImageIcon(
                            AssetImage('assets/profile_page/icons/profile_link_icon.png'),
                            size: 14,
                          ),
                          SizedBox(width: 8),
                          InkWell(
                            child: RichText(
                              text:TextSpan(style: TextsStyles.profileHyperlink(), children: [
                                TextSpan(text:'www.instagram.com/aliramps'),
                              ])
                            ),
                            onTap: () async {
                              final url = 'https://www.instagram.com/aliramps'; //example url
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                          ),
                        ]
                      ),
                    )  
                  ]
                )
              ),
              //sponsored row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CustomBorders.profilePictureBorder(width: 40.0, height: 40.0),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.6, vertical: 1.6),
                          child: Container(
                            width: 36.8,
                            height: 36.8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/profile_page/icons/example_sponsor_image.png'),
                                fit: BoxFit.scaleDown,
                              )
                            )
                          )
                        )
                      ]
                    ),
                    SizedBox(width: 16),
                    RichText(
                      text: TextSpan( 
                        style: GoogleFonts.openSans(fontSize: 14, color: Colors.black),
                        children: [
                          TextSpan(text:'Sponsored by ', style: TextsStyles.profileDescription()),
                          TextSpan(text: 'Spitfire Wheels', style: TextsStyles.termsAndConditionsBold(),
                          ),
                        ]
                      )
                    ),
                  ]
                )
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: RichText(
                        text:TextSpan(style: TextsStyles.profileHyperlink(), children: [
                          TextSpan(text:'Edit profile'),
                        ])
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryGold60,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    )
                  ]
                ),
              ),
    );
  }
}
