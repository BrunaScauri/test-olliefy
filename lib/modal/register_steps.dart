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
class Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Container(
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder:(context, animation, secondaryAnimation) => Permissions(),
                )
              );
            },
            child: Text('permissions screen')
          )
        )
      ),
    );
  }
}
class Permissions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Container(
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder:(context, animation, secondaryAnimation) => MainScreen(),
                )
              );
            },
            child: Text('main screen')
          )
        )
      ),
    );
  }
}