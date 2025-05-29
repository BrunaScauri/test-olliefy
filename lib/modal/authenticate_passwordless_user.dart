import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/components/atoms/create_page/success_snackbar.dart';

import 'package:test_olliefy/services/auth_service.dart';
import 'package:test_olliefy/components/molecules/register_user_navigation_header.dart';
import 'package:test_olliefy/screens/app_tab.dart';
import 'package:test_olliefy/screens/main_screen.dart';

class AuthenticatePasswordlessUser extends StatefulWidget {
  @override
  State<AuthenticatePasswordlessUser> createState() => _AuthenticatePasswordlessUserState();
  final String phoneNumber;

  const AuthenticatePasswordlessUser({super.key, required this.phoneNumber});
}

class _AuthenticatePasswordlessUserState extends State<AuthenticatePasswordlessUser> {
  final TextEditingController _tokenController = TextEditingController();

  @override
  void dispose() {
    _tokenController.dispose();
    super.dispose();
  }

  signInWithToken(value) async {
    try {
      await authService.value.signInWithSmsCode(smsCode: value);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AppTab(initialIndex: 1)),
      );
    } catch(e) {
      showSuccessSnackbar(label: 'Please input a valid code.');
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: AppColors.primaryGold60,
        toolbarHeight: 48,
        automaticallyImplyLeading: false
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 370),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: RegisterUserNavigationHeader(backButtonEnterPage: MainScreen(), backButtonExitPage: AuthenticatePasswordlessUser(phoneNumber: ''), closeButtonEnterPage: MainScreen(), closeButtonExitPage: AuthenticatePasswordlessUser(phoneNumber: ''),),
                ),
                Padding(
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
                          length: 6,
                          obscureText: false,
                          animationDuration: Duration(milliseconds: 500), 
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            borderWidth: 0.5,
                            fieldHeight: 45,
                            fieldWidth: 45,
                            activeColor: AppColors.primaryBlack,
                            selectedColor: AppColors.primaryGold70,
                            inactiveColor: AppColors.primaryBlack,
                          ),
                          autoDisposeControllers: false,
                          keyboardType: TextInputType.number,
                          autoDismissKeyboard: true,
                          onCompleted: (value) {
                            signInWithToken(value);
                          },
                        ),
                      ),
                      RichText(
                        text:TextSpan(style: TextStyles.primaryText(), children: [
                          TextSpan(text:'Didn’t receive the message? '),
                          TextSpan(
                            text:' Resend', 
                            style: GoogleFonts.openSans(color: AppColors.primaryGold70, fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                try {
                                  await authService.value.signInUserByPhone(phone: widget.phoneNumber);
                                  showSuccessSnackbar(label: 'SMS code was resent');
                                } catch (e) {
                                  showSuccessSnackbar(label: 'Unknown error. Please try again.');
                                }
                              }
                          )
                        ]
                      )
                    ),
                  ]
                )
              )
            ]
          )
        )
      ),
    );
  }
}