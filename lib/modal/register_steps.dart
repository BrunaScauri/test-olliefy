import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_olliefy/screens/main_screen.dart';
import 'package:test_olliefy/modal/user_modal.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/fields.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:flutter_svg/svg.dart';


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
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: RichText(
                  text:TextSpan(style: GoogleFonts.openSans(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryBlack), children: [
                    TextSpan(text:'Choose a name for your profile'),
                  ])
                ),
              ),
              const SizedBox(height: 20),
              Consumer<UserModal>(
                builder: (context, modal, child) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 340),
                      child: TextFormField(
                        controller: _profileNameController,
                        onChanged: (value) {
                          modal.updateProfileName(value);
                        },
                        decoration: FormDecorations.textFieldDecoration(
                          labelText: 'Username',
                        ),
                      ),
                    )
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

class _PhoneOrEmailState extends State<PhoneOrEmail> {
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Center(
        child: Column(
          children: [
            Consumer<UserModal>(
              builder: (context, modal, child) {
                return Container(
                  // padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: RichText(
                        text:TextSpan(style: GoogleFonts.openSans(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryBlack), children: [
                          TextSpan(text:'Add a phone number or email address'),
                          ])
                        ),
                      ),
                      const SizedBox(height: 20),
                      DefaultTabController(
                        initialIndex: 0,
                        length: 2,
                        child: Center(
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  width: 400,
                                  child:TabBar(
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
                                  child: TabBarView(
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        const SizedBox(height: 20),
                                        Consumer<UserModal>(
                                          builder: (context, modal, child) {
                                            return Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Container(
                                                constraints: BoxConstraints(maxWidth: 340),
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
                                              )
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 10),
                                        Container(
                                          constraints: BoxConstraints(maxWidth: 340),
                                          child: Divider(height: 40, thickness: 0.8),
                                        ),
                                        Container(
                                          constraints: BoxConstraints(maxWidth: 370),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: AppColors.primaryWhite,
                                                    minimumSize: Size(350, 60),
                                                    shadowColor: AppColors.primaryBlack,
                                                    elevation: 3.0,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/google_logo.png',
                                                        height: 12,
                                                        width: 12,
                                                      ),
                                                      RichText(
                                                        text: TextSpan(
                                                          style: GoogleFonts.openSans(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: AppColors.primaryBlack,
                                                          ),
                                                          children: [
                                                            TextSpan(text: '  Continue with Google'),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                ElevatedButton(
                                                  onPressed: () {},
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: AppColors.primaryBlack,
                                                    minimumSize: Size(350, 60),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/Apple_logo.svg',
                                                        colorFilter: const ColorFilter.mode(AppColors.primaryWhite, BlendMode.srcIn),
                                                        height: 15,
                                                      ),
                                                      RichText(
                                                        text: TextSpan(
                                                          style: GoogleFonts.openSans(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold,
                                                              color: AppColors.primaryWhite),
                                                          children: [
                                                            TextSpan(text: '  Continue with Apple'),
                                                          ],
                                                        ),
                                                      ),
                                                    ]
                                                  )
                                                ),
                                              ]
                                            )
                                          )
                                        )
                                        
                                      ]
                                    ),
                                    Column(
                                      children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Container(
                                          constraints: BoxConstraints(maxWidth: 340),
                                          child: TextFormField(
                                            controller: _phoneController,
                                            onChanged: (value) {
                                              modal.updatePhoneNumber(value);
                                            },
                                            decoration: FormDecorations.textFieldDecoration(
                                              labelText: 'Phone number',
                                              prefixIcon: Icons.email_outlined,
                                            ),
                                          ),
                                        )
                                      )

                                      ]
                                    ),
                                  ]
                                  ),
                                )
                              ]
                            )
                          )
                        ),
                      ),  
                    ]
                  )
                  );
                }
            ),
            
          ]
        )
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
          child: Consumer<UserModal>(
              builder: (context, modal, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      RichText(
                        text:TextSpan(style: GoogleFonts.openSans(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryBlack), children: [
                          TextSpan(text:'Enter the code'),
                        ])
                      ),
                      SizedBox(height: 16),
                      RichText(
                        text:TextSpan(style: GoogleFonts.openSans(fontSize: 14, color: AppColors.primaryBlack), children: [
                          TextSpan(text:'We sent a code to validate your phone number.'),
                        ])
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('code')
                      ),
                      //code input goes here
                      RichText(
                        text:TextSpan(style: GoogleFonts.openSans(fontSize: 14, color: AppColors.primaryBlack), children: [
                          TextSpan(text:'Didn’t receive the message? '),
                          TextSpan(
                            text:' Resend', style: GoogleFonts.openSans(color: AppColors.primaryGold70, fontWeight: FontWeight.bold)
                            // onclick: 
                            ),
                        ])
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 340),
                        child: TextFormField(
                          controller: _tokenController,
                          onChanged: (value) {
                            modal.updateToken(value);
                          },
                          decoration: FormDecorations.textFieldDecoration(
                            labelText: 'Phone number',
                            prefixIcon: Icons.email_outlined,
                          ),
                        ),
                      )
                    ]
                  );
              }
            )
        )
      ),
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
                      text:TextSpan(style: GoogleFonts.openSans(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryBlack), children: [
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
            backgroundColor: Colors.primaryWhite,
            body: Column(
              children: [
                Consumer<UserModal>(
                builder: (context, modal, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Container(
                                child: Image(image: AssetImage('assets/permissions_page_hero.png'), height: 160, width: 160),
                              ),
                              SizedBox(height: 40),
                              Container(
                                  child: RichText(
                                    text:TextSpan(style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryBlack), children: [
                                      TextSpan(text:'For a more fun experience, we need to activate some permissions.'),
                                    ])
                                  )
                              ),
                            ]
                          )
                        ),
                        SizedBox(height: 40),
                        Container(
                          constraints: BoxConstraints(maxWidth: 450),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Image(image: AssetImage('assets/map_pin.png'), height: 30, width: 30),
                                  ),
                                  SizedBox(width: 16),
                                  RichText(
                                  text:TextSpan(style: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.primaryBlack), children: [
                                    TextSpan(text:'Location'),
                                    ])
                                  ),
                                ]
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    child: Image(image: AssetImage('assets/camera.png'), height: 30, width: 30),
                                  ),
                                  SizedBox(width: 16),
                                  RichText(
                                  text:TextSpan(style: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.primaryBlack), children: [
                                    TextSpan(text:'Camera'),
                                    ])
                                  ),
                                ]
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    child: Image(image: AssetImage('assets/gallery.png'), height: 30, width: 30),
                                  ),
                                  SizedBox(width: 16),
                                  RichText(
                                  text:TextSpan(style: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.primaryBlack), children: [
                                    TextSpan(text:'Photo gallery'),
                                    ])
                                  ),
                                ]
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    child: Image(image: AssetImage('assets/phone.png'), height: 30, width: 30),
                                  ),
                                  SizedBox(width: 16),
                                  RichText(
                                  text:TextSpan(style: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.primaryBlack), children: [
                                    TextSpan(text:'Contacts'),
                                    ])
                                  ),
                                ]
                              ),
                            ]
                          )
                        )
                      ]
                    )
                  );
                },
              )
              ]
            )
          )
        );
  }
}