import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/services.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/styles/fields.dart';
import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';
import 'package:test_olliefy/components/atoms/edit_profile_picture_icon.dart';
import 'package:test_olliefy/utils/route/slide_incoming_from_top.dart';

import 'package:test_olliefy/screens/profile/user_profile.dart';
import 'package:test_olliefy/screens/profile/add_sponsor.dart';

class EditUserProfile extends StatefulWidget {
  @override
  _EditUserProfileState createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _dateOfBirthController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0),
          child: AppBar(
            title: Text('Edit Profile', style: TextsStyles.profileDataBold()),
          ),
        ),
      ),
			body: SingleChildScrollView(
				child: Container(
          constraints: BoxConstraints(maxWidth: 370),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment(1.2, 1.0),
                  children: [
                    ProfilePicture(borderWidth: 150.0, borderHeight: 150.0, imageWidth: 138.0, imageHeight: 138.0, imageHorizontalPadding: 6.0, imageVerticalPadding: 6.0, imagePath: 'assets/profile_page/icons/example_pfp/4.jpeg'),
                    EditProfilePictureIcon(),
                  ]
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _usernameController,
                  onChanged: (value) {
                    // modal.updateUsername(value);
                  },
                  decoration: FormDecorations.textFieldDecoration(
                    labelText: 'Username',
                  )
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _dateOfBirthController,
                  onChanged: (value) {
                    // modal.updateDateOfBirth(value);
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    MaskTextInputFormatter(
                      mask: '##/##/####',
                    )
                  ],
                  decoration: FormDecorations.textFieldDecoration(
                    labelText: 'Date of birth',
                  )
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _nameController,
                  onChanged: (value) {
                    // modal.updateName(value);
                  },
                  decoration: FormDecorations.textFieldDecoration(
                    labelText: 'Name',
                  )
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  onChanged: (value) {
                    // modal.updateEmail(value);
                  },
                  decoration: FormDecorations.textFieldDecoration(
                    labelText: 'Email',
                  )
                ),
                //'my sponsors' section
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('MY SPONSORS', style: TextsStyles.spacedGray()),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0), 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ProfilePicture(
                                borderWidth: 50.0,
                                borderHeight: 50.0,
                                imageWidth: 46.0,
                                imageHeight: 46.0,
                                imageHorizontalPadding: 2.0,
                                imageVerticalPadding: 2.0,
                                imagePath: 'assets/profile_page/example_sponsors/1.jpeg'),
                                SizedBox(width: 8.0),
                                Text('Tree Skateshop'),
                              ]
                            ),
                            IconButton(
                              icon: Image.asset('assets/profile_page/icons/trash_icon.png', width: 18),
                              onPressed: () {
                              },
                            ),

                          ]
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0), 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ProfilePicture(
                                borderWidth: 50.0,
                                borderHeight: 50.0,
                                imageWidth: 46.0,
                                imageHeight: 46.0,
                                imageHorizontalPadding: 2.0,
                                imageVerticalPadding: 2.0,
                                imagePath: 'assets/profile_page/example_sponsors/2.jpeg',),
                                SizedBox(width: 8.0),
                                Text('DGK Skateboard'),
                              ]
                            ),
                            IconButton(
                              icon: Image.asset('assets/profile_page/icons/trash_icon.png', width: 18),
                              // iconSize: 20,
                              onPressed: () {
                              },
                            ),

                          ]
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0), 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ProfilePicture(
                                borderWidth: 50.0,
                                borderHeight: 50.0,
                                imageWidth: 46.0,
                                imageHeight: 46.0,
                                imageHorizontalPadding: 2.0,
                                imageVerticalPadding: 2.0,
                                imagePath: 'assets/profile_page/example_sponsors/3.jpeg',),
                                SizedBox(width: 8.0),
                                Text('The Kayo Corp.'),
                              ]
                            ),
                            IconButton(
                              icon: Image.asset('assets/profile_page/icons/trash_icon.png', width: 18),
                              // iconSize: 20,
                              onPressed: () {
                              },
                            ),

                          ]
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          builder: (BuildContext context) {
                            return AddSponsor();
                          },
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
                                  TextSpan(text: 'Add sponsor'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 48.0),
                      ElevatedButton(
                        onPressed:() {
                          Navigator.of(context).push(
                            slideIncomingFromTop(
                              enterPage: UserProfile(), exitPage: EditUserProfile(),
                            ),
                          );
                        },
                        child: Text(
                          'Save', style: TextStyles.elevatedButtonText(color: AppColors.primaryBlack) 
                        ),
                        style: ButtonStyles.elevatedButton(backgroundColor: AppColors.primaryGold60),
                      )
                    ]
                  )
                )
              ]
            )
          )
        )
			),
    );
  }
}
