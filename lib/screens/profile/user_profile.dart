import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/route/page_slide_animation.dart';


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
                            // Navigator.of(context).pushReplacement(
                            //   pageSlideAnimation(const MainScreen())
                            // );
                          }
                        ),
                        IconButton(
                          icon: Image.asset('assets/profile_page/icons/favorites_icon.png', width: 18),
                          iconSize: 18,
                          onPressed: () {
                            // Navigator.of(context).pushReplacement(
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
                            // Navigator.of(context).pushReplacement(
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
                            // Navigator.of(context).pushReplacement(
                            //   pageSlideAnimation(const MainScreen())
                            // );
                          }
                        ),
                      ]
                    )
                  ]
                ),
              ),
            ]
          )
        ),
      ),
    );
  }
}
