import 'package:flutter/material.dart';

import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/fields.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:google_fonts/google_fonts.dart';

class UserChat extends StatefulWidget {
  @override
  _UserChatState createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                child: AppBar(
                  backgroundColor: AppColors.primaryWhite,
                ),
              ),
              Positioned(
                left: 108.0,
                top: 10.0,
                child: Text( 'Vortex', style: TextsStyles.profileDataBold()),
              ),
              Positioned(
                left: 56.0,
                child: ProfilePicture(borderWidth: 40.0, borderHeight: 40.0, imageWidth: 36.8, imageHeight: 36.8, imageHorizontalPadding: 1.6, imageVerticalPadding: 1.6, imagePath: 'assets/profile_page/icons/example_pfp/4.jpeg'),
              ),
              Positioned(
                right: 10.0,
                top: 10.0,
                child: Image.asset(
                  'assets/profile_page/icons/chat_search_icon.png',
                  height: 16,
                  width: 16,
                ),
              )
            ]
          )
        ),
      ),
			body: Center(
				child: Container(
          constraints: BoxConstraints(maxWidth: 370),
          child:Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              children: [
                  Text('TUE, MAY 21, 2024', style: TextsStyles.spacedGray(),
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: ProfilePicture(borderWidth: 30.0, borderHeight: 30.0, imageWidth: 27.6, imageHeight: 27.6, imageHorizontalPadding: 1.2, imageVerticalPadding: 1.2, imagePath: 'assets/profile_page/icons/example_pfp/4.jpeg'),
                    ),
                    SizedBox(width: 16.0),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      margin: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: AppColors.chatMessageGrey,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0),
                        ),
                      ),
                      child: Text(
                        "Hey! Thanks for passing by",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    ),
                  ]
                ),
                SizedBox(width: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Positioned(
                      right: 0.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColors.primaryGray80,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                topLeft: Radius.circular(40.0),
                                bottomLeft: Radius.circular(40.0)),
                          ),
                          child: Text("You're welcome ;)", style: TextStyle(color: AppColors.primaryWhite)),
                      ),
                    )
                  ]
                ),
                Expanded(
                  child: Container(
                    color: AppColors.primaryWhite,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Stack(
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: 340),
                        child: TextFormField(
                          onChanged: (value) {
                          },
                          decoration: FormDecorations.textFieldDecoration(
                            labelText: 'Write a message', textColor: AppColors.primaryGray5
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0.5,
                        top: 4.25,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: Icon(
                            Icons.arrow_circle_right, color: AppColors.primaryGray5
                          )
                        ),
                      )

                    ]
            
                  ),
                ),
                
              ]
            )
          )
        )
			),
    );
  }
}