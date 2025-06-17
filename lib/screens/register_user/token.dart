import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';

import 'package:test_olliefy/modal/user_modal.dart';


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
      resizeToAvoidBottomInset: false,
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
                              length: 6,
                              obscureText: false,
                              animationDuration: Duration(milliseconds: 500), 
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                borderWidth: 1.0,
                                fieldHeight: 40,
                                fieldWidth: 40,
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
                              // onSubmitted: //validate token
                            ),
                          ),
                          RichText(
                            text:TextSpan(style: TextStyles.primaryText(), children: [
                              TextSpan(text:'Didn’t receive the message? '),
                              TextSpan(
                                text:' Resend', style: GoogleFonts.openSans(color: AppColors.primaryGold70, fontWeight: FontWeight.bold)
                                //todo: implement resend logic
                              ),
                            ]
                          )
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