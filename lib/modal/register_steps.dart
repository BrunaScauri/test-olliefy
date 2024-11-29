import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_olliefy/screens/main_screen.dart';
import 'package:test_olliefy/modal/user_modal.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/fields.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';


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
      backgroundColor: AppColors.white,
      body: Center(
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: RichText(
                  text:TextSpan(style: GoogleFonts.openSans(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black), children: [
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
                      constraints: BoxConstraints(maxWidth: 450),
                      child: TextFormField(
                        controller: _profileNameController,
                        onChanged: (value) {
                          modal.updateProfileName(value); // Update the modal state
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
final TextEditingController _usernameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: RichText(
                text:TextSpan(style: GoogleFonts.openSans(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black), children: [
                  TextSpan(text:'Add a phone number or email address'),
                ])
              ),
            ),
            const SizedBox(height: 20),
            Consumer<UserModal>(
              builder: (context, modal, child) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 450),
                    child: TextFormField(
                      controller: _emailController,
                      onChanged: (value) {
                        modal.updateEmail(value);
                      },
                      decoration: FormDecorations.textFieldDecoration(
                        labelText: 'Email address',
                      ),
                    ),
                  )
                );
              },
            ),
          ]
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
      backgroundColor: AppColors.white,
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
                      text:TextSpan(style: GoogleFonts.openSans(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black), children: [
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
                    constraints: BoxConstraints(maxWidth: 450),
                    child: TextFormField(
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
  // final TextEditingController _passwordController = TextEditingController();

  // @override
  // void dispose() {
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  @override
    Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserModal>(
      create: (context) => UserModal(),
          child: Scaffold(
            backgroundColor: Colors.white,
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
                                    text:TextSpan(style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), children: [
                                      TextSpan(text:'For a more fun experience, we need to activate some permissions.'),
                                    ])
                                  )
                              ),
                            ]
                          )
                        ),
                        
                        SizedBox(height: 40),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Image(image: AssetImage('assets/map_pin.png'), height: 30, width: 30),
                                  ),
                                  SizedBox(width: 16),
                                  RichText(
                                  text:TextSpan(style: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black), children: [
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
                                  text:TextSpan(style: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black), children: [
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
                                  text:TextSpan(style: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black), children: [
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
                                  text:TextSpan(style: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black), children: [
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