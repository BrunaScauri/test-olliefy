import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_olliefy/utils/styles/prefix_flag.dart';
import 'package:country_icons/country_icons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/fields.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/styles/socials_button.dart';

import 'package:test_olliefy/modal/user_modal.dart';
import 'package:test_olliefy/components/molecules/permissions_card.dart';
import 'package:test_olliefy/components/organisms/suggested_profiles_card.dart';
import 'package:test_olliefy/components/atoms/follow_button.dart';
import 'package:test_olliefy/components/atoms/following_button.dart';

class ProfileName extends StatefulWidget {
  @override
  _ProfileNameState createState() => _ProfileNameState();
}

class _ProfileNameState extends State<ProfileName> {
  final TextEditingController _profileNameController = TextEditingController();

  @override
  void dispose() {
    _profileNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 370),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: RichText(
                  text:TextSpan(style: TextStyles.primaryHeader(), children: [
                    TextSpan(text:'Choose a name for your profile'),
                  ])
                ),
              ),
              const SizedBox(height: 20),
              Consumer<UserModal>(
                builder: (context, modal, child) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: _profileNameController,
                      onChanged: (value) {
                        modal.updateProfileName(value);
                      },
                      decoration: FormDecorations.textFieldDecoration(
                        labelText: 'Username',
                      ),
                    ),
                  );
                },
              )
            ]
          )
        )
      ),
    );
  }
}

class PhoneOrEmail extends StatefulWidget {
  @override
  _PhoneOrEmailState createState() => _PhoneOrEmailState();
}

class _PhoneOrEmailState extends State<PhoneOrEmail> with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late TabController _tabController;
  String _currentFlag = '';
  
   void _updateFlag(String value) {
    if (value.length >= 3) {
      final prefix = value.substring(1, 3); //extract 2 first chars skipping "+"
      setState(() {
        _currentFlag = getImagePath(prefix) ?? _currentFlag;
      });
    } else {
      setState(() {
        _currentFlag = _currentFlag;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Center(
        child: Consumer<UserModal>(
          builder: (context, modal, child) {
            return Container(
              constraints: BoxConstraints(maxWidth: 370),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RichText(
                    text:TextSpan(style: TextStyles.primaryHeader(), children: [
                      TextSpan(text:'Add a phone number or email address'),
                      ])
                    ),
                  ),
                  const SizedBox(height: 20),
                  DefaultTabController(
                    initialIndex: 0,
                    length: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          Container(
                            width: 400,
                            child:TabBar(
                              controller: _tabController,
                              tabs: [
                                Tab(text: 'Email'),
                                Tab(text: 'Phone'),
                              ],
                              labelColor: AppColors.primaryBlack,
                              indicatorColor: AppColors.primaryGold70,
                              labelStyle: TextStyle(fontWeight: FontWeight.bold),
                              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                            )
                          ),
                          SizedBox(
                            height: 300,
                            child: AnimatedBuilder(
                              animation: _tabController.animation!,
                              builder: (context, child) {
                                return Stack(
                                  children: [
                                    // email tab
                                    Opacity(
                                      opacity: 1.0 - _tabController.animation!.value,
                                      child: IgnorePointer(
                                        ignoring: _tabController.animation!.value != 0,
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 20),
                                            Consumer<UserModal>(
                                              builder: (context, modal, child) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: TextFormField(
                                                    controller: _emailController,
                                                    onChanged: (value) {
                                                      modal.updateEmail(value);
                                                    },
                                                    decoration: FormDecorations.textFieldDecoration(
                                                      labelText: 'Email address',
                                                      prefixIcon: Icons.email_outlined,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            const SizedBox(height: 10),
                                            Container(
                                              constraints: BoxConstraints(maxWidth: 340),
                                              child: Divider(height: 40, thickness: 0.8),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Column(
                                                children: [
                                                  CustomButtons.socialsButton(
                                                    backgroundColor: AppColors.primaryWhite,
                                                    assetPath: 'assets/google_logo.svg',
                                                    buttonText: 'Continue with Google',
                                                    textColor: AppColors.primaryBlack,
                                                    onPressed: () {
                                                    },
                                                  ),
                                                  const SizedBox(height: 16),
                                                  CustomButtons.socialsButton(
                                                    backgroundColor: AppColors.primaryBlack,
                                                    assetPath: 'assets/apple_logo.svg',
                                                    buttonText: 'Continue with Apple',
                                                    textColor: AppColors.primaryWhite,
                                                    onPressed: () {
                                                    },
                                                  ),
                                                ]
                                              )
                                            )
                                          ]
                                        ),
                                      ),
                                    ),
                                    // phone tab
                                    Opacity(
                                      opacity: _tabController.animation!.value,
                                      child: IgnorePointer(
                                        ignoring: _tabController.animation!.value != 1,
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 20),
                                            Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    controller: _phoneController,
                                                    keyboardType: TextInputType.number,
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter.digitsOnly,
                                                      MaskTextInputFormatter(
                                                        mask: '+## ### ### ###',
                                                      )
                                                    ],
                                                    onChanged: (value) {
                                                      _updateFlag(value);
                                                      modal.updatePhoneNumber(value);
                                                    },
                                                    //decoration for the flag icon
                                                    decoration: InputDecoration(
                                                      labelText: 'Phone number',
                                                      prefixIcon: _currentFlag == '' ? 
                                                      SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child: Center(
                                                          child: CircleAvatar(
                                                            radius: 25,
                                                            backgroundColor: Colors.transparent,
                                                            child: Image.asset(
                                                              'assets/default_flag.png',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          )
                                                        ),
                                                      ) : 
                                                      SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child: Center(
                                                          child: CircleAvatar(
                                                            radius: 12,
                                                            backgroundImage: AssetImage(
                                                              _currentFlag,
                                                              package: 'country_icons',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ]
                                              )
                                            )
                                          ]
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                        ]
                      )
                    )
                  ),  
                ]
              )
            );
          }
        ),
      ),
    );
  }
}

class Token extends StatefulWidget {
  @override
  _TokenState createState() => _TokenState();
}

class _TokenState extends State<Token> {
final TextEditingController _tokenController = TextEditingController();

  @override
  void dispose() {
    _tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColors.primaryWhite,
    body: Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 370),
          child: Column(
            children: [
              Consumer<UserModal>(
                builder: (context, modal, child) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text:TextSpan(style: TextStyles.primaryHeader(), children: [
                            TextSpan(text:'Enter the code'),
                          ])
                        ),
                        SizedBox(height: 16),
                        RichText(
                          text:TextSpan(style: TextStyles.primaryText(), children: [
                            TextSpan(text:'We sent a code to validate your phone number.'),
                          ])
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 40.0),
                          child: PinCodeTextField(
                            controller: _tokenController,
                            appContext: context,
                            length: 5,
                            obscureText: false,
                            animationDuration: Duration(milliseconds: 500), 
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              borderWidth: 10.0,
                              fieldHeight: 56,
                              fieldWidth: 56,
                              activeColor: AppColors.primaryBlack,
                              selectedColor: AppColors.primaryGold70,
                              inactiveColor: AppColors.primaryBlack,
                            ),
                            autoDisposeControllers: false,
                            keyboardType: TextInputType.number,
                            autoDismissKeyboard: false,
                            onCompleted: (value) {
                              modal.updateToken(value);
                            },
                          ),
                        ),
                        RichText(
                          text:TextSpan(style: TextStyles.primaryText(), children: [
                            TextSpan(text:'Didn’t receive the message? '),
                            TextSpan(
                              text:' Resend', style: GoogleFonts.openSans(color: AppColors.primaryGold70, fontWeight: FontWeight.bold)
                            ),
                          ])
                        ),
                      ]
                    )
                  );
                }
              )
            ]
          )
        )
      )
    );
  }
}

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 370),
          child: Column(
            children: [
              SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: RichText(
                      text:TextSpan(style: TextStyles.primaryHeader(), children: [
                        TextSpan(text:'Create a password'),
                      ])
                    ),
                  ),
                ]
              ),
              const SizedBox(height: 20),
              Consumer<UserModal>(
              builder: (context, modal, child) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 340),
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      onChanged: (value) {
                        modal.updatePassword(value);
                      },
                      decoration: FormDecorations.textFieldDecoration(
                        labelText: 'Password',
                      ),
                    ),
                  )
                );
              },
            ),
            ]
          )
        )
      ),
    );
  }
}

class Permissions extends StatefulWidget {
  @override
  _PermissionsState createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserModal>(
      create: (context) => UserModal(),
      child: Scaffold(
        backgroundColor: AppColors.primaryWhite,
        body: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 370),
            child: Consumer<UserModal>(
              builder: (context, modal, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 40.0),
                        child: Image.asset('assets/permissions_page/permissions_page_hero.png', height: 160),
                      ),
                      Container(
                          child: RichText(
                            text:TextSpan(style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryBlack), children: [
                              TextSpan(text:'For a more fun experience, we need to activate some permissions.'),
                            ])
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.0),
                        child: Column(
                          children: [
                            PermissionsCard(imagePath: 'assets/permissions_page/icons/location_icon.svg', permissionName: 'Location'),
                            SizedBox(height: 18),
                            PermissionsCard(imagePath: 'assets/permissions_page/icons/camera_icon.svg', permissionName: 'Camera'),
                            SizedBox(height: 16),
                            PermissionsCard(imagePath: 'assets/permissions_page/icons/photo_gallery_icon.svg', permissionName: 'Photo gallery'),
                            SizedBox(height: 16),
                            PermissionsCard(imagePath: 'assets/permissions_page/icons/contacts_icon.svg', permissionName: 'Contacts'),
                            SizedBox(height: 16),
                          ]
                        )
                      )
                    ]
                  )
                );
              },
            )
          )
        )
      )
    );
  }
}

class SuggestedProfiles extends StatefulWidget {
  @override
  _SuggestedProfilesState createState() => _SuggestedProfilesState();
}

class _SuggestedProfilesState extends State<SuggestedProfiles> {
  final List<Map<String, dynamic>> items = [
    {'imagePath': 'assets/profile_page/icons/example_pfp/0.jpeg', 'profileName': 'a way too long name', 'following': false},
    {'imagePath': 'assets/profile_page/icons/example_pfp/1.jpeg', 'profileName': 'this is a scrollable list', 'following': true},
    {'imagePath': 'assets/profile_page/icons/example_pfp/2.jpeg', 'profileName': 'trickwizard', 'following': true},
    {'imagePath': 'assets/profile_page/icons/example_pfp/3.jpeg', 'profileName': 'board_beast', 'following': true},
    {'imagePath': 'assets/profile_page/icons/example_pfp/0.jpeg', 'profileName': 'sk8_legend', 'following': false},
    {'imagePath': 'assets/profile_page/icons/example_pfp/1.jpeg', 'profileName': 'pavementripper', 'following': false},
    {'imagePath': 'assets/profile_page/icons/example_pfp/2.jpeg', 'profileName': 'trickwizard', 'following': true},
    {'imagePath': 'assets/profile_page/icons/example_pfp/3.jpeg', 'profileName': 'board_beast', 'following': false},
    {'imagePath': 'assets/profile_page/icons/example_pfp/0.jpeg', 'profileName': 'sk8_legend', 'following': true},
    {'imagePath': 'assets/profile_page/icons/example_pfp/1.jpeg', 'profileName': 'pavementripper', 'following': false},
    {'imagePath': 'assets/profile_page/icons/example_pfp/2.jpeg', 'profileName': 'trickwizard', 'following': false},
    {'imagePath': 'assets/profile_page/icons/example_pfp/3.jpeg', 'profileName': 'board_beast', 'following': true},
    {'imagePath': 'assets/profile_page/icons/example_pfp/0.jpeg', 'profileName': 'sk8_legend', 'following': false},
    {'imagePath': 'assets/profile_page/icons/example_pfp/1.jpeg', 'profileName': 'pavementripper', 'following': true},
    {'imagePath': 'assets/profile_page/icons/example_pfp/2.jpeg', 'profileName': 'trickwizard', 'following': true},
    {'imagePath': 'assets/profile_page/icons/example_pfp/3.jpeg', 'profileName': 'board_beast', 'following': true},
    {'imagePath': 'assets/profile_page/icons/example_pfp/0.jpeg', 'profileName': 'sk8_legend', 'following': false},
    {'imagePath': 'assets/profile_page/icons/example_pfp/1.jpeg', 'profileName': 'pavementripper', 'following': false},
    {'imagePath': 'assets/profile_page/icons/example_pfp/2.jpeg', 'profileName': 'trickwizard', 'following': false},
    {'imagePath': 'assets/profile_page/icons/example_pfp/3.jpeg', 'profileName': 'board_beast', 'following': false},
  ];

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: AppColors.primaryWhite,
    body: Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 370),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyles.primaryHeader(),
                  children: [
                    TextSpan(text: 'Follow some skaters in your area'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Consumer<UserModal>(
                builder: (context, modal, child) {
                  return ListView.separated(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SuggestedProfileCard(
                            imagePath: item['imagePath'],
                            profileName: item['profileName'],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 1.0),
                            child: item['following'] == true ? FollowButton() : FollowingButton()
                          )

                        ]
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 29),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
