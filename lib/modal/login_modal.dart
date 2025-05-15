import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:test_olliefy/services/auth_service.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/fields.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/components/molecules/bottom_sheet_header.dart';
import 'package:test_olliefy/utils/styles/socials_button.dart';
import 'package:test_olliefy/components/atoms/drag_bar.dart';
import 'package:test_olliefy/screens/app_tab.dart';

class LoginModal extends StatefulWidget {
  @override
  _LoginModalState createState() => _LoginModalState();
}

class _LoginModalState extends State<LoginModal> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkIfEmpty);
  }

  void _checkIfEmpty() {
    setState(() {
      _isButtonEnabled = _controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: AppColors.primaryWhite,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetHeader(
            title: 'LOG IN',
          ),
          //textfield for login and button
          Padding(
            padding: EdgeInsets.symmetric(vertical: 35.0),
            child: Column(
              children: [
                TextFormField(
                    controller: _controller,
                    onChanged: (value) {
                    final emailRegExp = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    );
                    setState(() {
                        _isButtonEnabled = emailRegExp.hasMatch(value);
                      });
                    },
                    decoration: FormDecorations.textFieldDecoration(labelText: 'Phone, email or username'),
                  ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _isButtonEnabled ? () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => AppTab()),
                    );
                  } : null,
                  style: _isButtonEnabled ? ButtonStyles.elevatedButton(backgroundColor: AppColors.primaryBlack) : ButtonStyles.elevatedButton(backgroundColor: AppColors.buttonDisabled12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: _isButtonEnabled 
                          ? TextStyles.elevatedButtonText(color: AppColors.primaryWhite) 
                          : TextStyles.elevatedButtonText(color: AppColors.primaryGray10),
                          children: [
                            TextSpan(text: 'Log in'),
                          ],
                        ),
                      ),
                    ]
                  ),
                ),
              ]
            )
          ),
          Divider(height: 10, thickness: 0.8),
          //socials buttons
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              children: [
                CustomButtons.socialsButton(
                  backgroundColor: AppColors.primaryWhite,
                  assetPath: 'assets/google_logo.svg',
                  buttonText: 'Continue with Google',
                  textColor: AppColors.primaryBlack,
                  onPressed: () {
                    try{
                      authService.value.signInWithGoogle();
                      Navigator.pop(context);
                    } catch(e) {
                      print(e.toString());
                    }
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
          ),
          RichText(
            text: TextSpan(
              style: GoogleFonts.openSans(fontSize: 14, color: Colors.black),
              children: [
                TextSpan(text: 'By logging in, you are accepting our ',
                    style: TextStyle(color: AppColors.primaryBlack)),
                TextSpan(
                  text: 'Terms and Conditions ',
                  style: TextsStyles.termsAndConditionsBold(),
                ),
                TextSpan(text: 'as well as the '),
                TextSpan(
                  text: 'Privacy Policy.',
                  style: TextsStyles.termsAndConditionsBold(),
                ),
              ],
            ),
          ),
          Flexible(child: Container())
        ],
      ),
    );
  }
}
