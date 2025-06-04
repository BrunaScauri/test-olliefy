import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';
import 'package:test_olliefy/utils/route/page_slide_animation.dart';
import 'package:test_olliefy/services/auth_service.dart';

import 'package:test_olliefy/screens/profile/edit_user_profile.dart';
import 'package:test_olliefy/screens/profile/user_settings.dart';
import 'package:test_olliefy/screens/profile/user_favorites.dart';
import 'package:test_olliefy/screens/profile/user_notifications.dart';
import 'package:test_olliefy/screens/profile/user_chat.dart';

import 'package:test_olliefy/screens/profile/user_posts.dart';
import 'package:test_olliefy/screens/profile/user_store.dart';
import 'package:test_olliefy/screens/profile/user_stats.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                //Profile name, settings, favorites, notifications and chat row
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 24.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 370),
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
                                Navigator.of(context).push(
                                  pageSlideAnimation(UserSettings())
                                );
                              }
                            ),
                            IconButton(
                              icon: Image.asset('assets/profile_page/icons/favorites_icon.png', width: 18),
                              iconSize: 18,
                              onPressed: () {
                                Navigator.of(context).push(
                                  pageSlideAnimation(UserFavorites())
                                );
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
                                Navigator.of(context).push(
                                  pageSlideAnimation(UserNotifications())
                                );
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
                                Navigator.of(context).push(
                                  pageSlideAnimation(UserChat())
                                );
                              }
                            ),
                          ]
                        )
                      ]
                    ),
                  )
                ),
                //profile picture, followers, following and posts' row
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 370),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                ProfilePicture(borderWidth: 80.0, borderHeight: 80.0, imageWidth: 73.6, imageHeight: 73.6, imageHorizontalPadding: 3.2, imageVerticalPadding: 3.2, imagePath: 'assets/profile_page/icons/example_profile_picture_icon.png'),
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
                  )
                ),
                //profile description, optional link container and optional sponsor rows
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 370),
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
                                  final url = Uri.parse('https://www.instagram.com/aliramps'); //example url
                                  if (await canLaunchUrl(url)) {
                                    await canLaunchUrl(url);
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
                  )
                ),
                //sponsored row
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 370),
                    child: Row(
                      children: [
                        ProfilePicture(borderWidth: 40.0, borderHeight: 40.0, imageWidth: 36.8, imageHeight: 36.8, imageHorizontalPadding: 1.6, imageVerticalPadding: 1.6, imagePath: 'assets/profile_page/icons/example_sponsor_image.png', imageFit: BoxFit.scaleDown),
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
                  )
                ),
                //edit profile button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 370),
                    child: Row(
                      children: [
                        Container(
                          width: 112,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                pageSlideAnimation(EditUserProfile())
                              );
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
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                            ),
                          )
                        ),
                      ]
                    )
                  )
                ),
                // todo: logout button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 370),
                    child: Row(
                      children: [
                        Container(
                          width: 112,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                if(FirebaseAuth.instance.currentUser != null) {
                                  await FirebaseAuth.instance.signOut();
                                } else {
                                  await authService.value.googleSignIn.disconnect();
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Error logging out: $e')),
                                );
                              }
                            },
                            child: RichText(
                              text: TextSpan(
                                style: TextsStyles.profileHyperlink(),
                                children: [
                                  TextSpan(text: 'Logout'),
                                ],
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // posts, my store and stats container
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 370),
                    child: Column(
                      children: [
                        DefaultTabController(
                          initialIndex: 0,
                          length: 3,
                          child: Column(
                            children: [
                              TabBar(
                                onTap: (index) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                                tabs: [
                                  Tab(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Posts'),
                                    ),
                                  ),
                                  Tab(text: 'My Store'),
                                  Tab(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text('Stats'),
                                    ),
                                  ),
                                ],
                                labelPadding: EdgeInsets.zero,
                                indicatorColor: AppColors.primaryGold70,
                                indicator: UnderlineTabIndicator(
                                  borderSide: BorderSide(
                                    width: 2.0,
                                    color: AppColors.primaryGold70,
                                  ),
                                  insets: currentIndex == 0
                                  ? EdgeInsets.only(right: 70.0)
                                  : currentIndex == 1
                                  ? EdgeInsets.zero
                                  : currentIndex == 2
                                  ? EdgeInsets.only(left: 75.0)
                                  : EdgeInsets.zero,
                                ),
                                labelColor: AppColors.primaryBlack,
                                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                transitionBuilder: (Widget child, Animation<double> animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                child: _buildPage(currentIndex),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]
            )
          )
        ]
      )
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return UserPosts(key: ValueKey<int>(0));
      case 1:
        return UserStore(key: ValueKey<int>(1));
      case 2:
        return UserStats(key: ValueKey<int>(2));
      default:
        return Container();
    }
  }
}