import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/fields.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/services/user_service.dart';
import 'package:test_olliefy/services/auth_service.dart';
import 'package:test_olliefy/components/molecules/bottom_sheet_header.dart';
import 'package:test_olliefy/utils/styles/socials_button.dart';
import 'package:test_olliefy/modal/authenticate_passwordless_user.dart';
import 'package:test_olliefy/components/atoms/create_page/success_snackbar.dart';

class LoginModal extends StatefulWidget {
  @override
  _LoginModalState createState() => _LoginModalState();
}

class _LoginModalState extends State<LoginModal> with WidgetsBindingObserver {
  final TextEditingController _controller = TextEditingController();
  final _userService = UserService();
  
  bool _isButtonEnabled = false;
  String inputText = '';
  isEmail(value) => RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$').hasMatch(value);
  isPhoneNumber(value) => RegExp(r'^\+?[0-9]+$').hasMatch(value);
  String normalizePhone(String input) {
    input = input.trim();
    return input.startsWith('+') ? input : '+$input';
  }
  bool _phoneFound = false;
  bool _emailFound = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkIfEmpty);
    WidgetsBinding.instance.addObserver(this);
  }

  //handle login modal being propped open when user is logged in from email link
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed) {
      FocusScope.of(context).unfocus();
    } if(mounted) {
      Navigator.of(context).pop();
    }
  }

  void _checkIfEmpty() {
    setState(() {
      _isButtonEnabled = _controller.text.isNotEmpty;
    });
  }

  checkIfUserExists(String inputValue) async  {
    if(isPhoneNumber(inputValue)) {
      final input = normalizePhone(inputValue);
      final checkPhone = await _userService.doesPhoneExist(input);
      if(checkPhone) {
        _phoneFound = true;
        signInUserByPhone(input);
      }
    } else if(isEmail(inputValue)) {
      final trimmedMail = inputValue.trim();
      final checkEmail = await _userService.doesEmailExist(trimmedMail);
      if(checkEmail) {
        _emailFound = true;
        signInUserByEmail(trimmedMail);
      }
    } else if(!_phoneFound && !_emailFound){
      final checkUsername = await _userService.doesUsernameExist(inputValue);
      if(checkUsername) {
        signInUserByUsername(inputValue);
      } else {
        print('credential error');
      }
    } else{
    }
    return;
  }

  signInUserByEmail(inputValue) async {
    final email = inputValue.trim();
    try {
      await authService.value.sendSignInLink(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  signInUserByPhone(inputValue) async {
    try {
      authService.value.signInUserByPhone(phone: inputValue);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AuthenticatePasswordlessUser(phoneNumber: inputValue)),
      );
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    };
  }

  signinUserByGoogle() async {
    try{
      authService.value.signInWithGoogle();
      Navigator.pop(context);
    } catch(e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
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
                    setState(() {
                      inputText = value;
                    });
                  },
                  decoration: FormDecorations.textFieldDecoration(labelText: 'Phone, email or username'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed:
                  _isButtonEnabled ? () {
                    checkIfUserExists(inputText);
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
                    signinUserByGoogle();
                  },
                ),
                const SizedBox(height: 16),
                CustomButtons.socialsButton(
                  backgroundColor: AppColors.primaryBlack,
                  assetPath: 'assets/apple_logo.svg',
                  buttonText: 'Continue with Apple',
                  textColor: AppColors.primaryWhite,
                  onPressed: () {
                    //todo: wait for apple developer program account
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
