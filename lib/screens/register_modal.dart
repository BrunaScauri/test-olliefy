import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
// import 'package:permission_handler/permission_handler.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/route/page_slide_animation.dart';
import 'package:test_olliefy/utils/route/slide_outgoing_down.dart';
import 'package:test_olliefy/utils/route/slide_outgoing_right.dart';

import 'package:test_olliefy/modal/user_modal.dart';
import 'package:test_olliefy/modal/register_steps.dart';
import 'package:test_olliefy/screens/main_screen.dart';
import 'package:test_olliefy/screens/profile/user_profile.dart';
import 'package:test_olliefy/screens/app_tab.dart';
import 'package:test_olliefy/components/atoms/permission_dialogue.dart';

class RegisterModal extends StatefulWidget {
  const RegisterModal({super.key});

  @override
  _RegisterModalState createState() => _RegisterModalState();
}

class _RegisterModalState extends State<RegisterModal> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGold60,
        toolbarHeight: 48,
        automaticallyImplyLeading: false
      ),
      backgroundColor: AppColors.primaryWhite,
      body: Column(
        children: [
          Consumer<UserModal>(
            builder: (context, modal, child) {
              return Container(
                child: Column(
                  children: [
                    //stepper indicator
                    Container(
                      color: AppColors.primaryGold60,
                      child: Row(
                        children: List.generate(modal.totalIndex,
                          (index) => Expanded(
                            child: Container(
                              height: 8,
                              decoration: BoxDecoration(
                                color: index <= modal.activeIndex
                                    ? AppColors.primaryGold20Stepper
                                    : AppColors.primaryGold10,
                                border: Border.all(
                                  color: index == modal.activeIndex
                                      ? AppColors.primaryGold60
                                      : AppColors.primaryGold40,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: index == 0 ? Radius.circular(40) : Radius.zero,
                                  topRight: index == modal.totalIndex - 1 ? Radius.circular(40) : Radius.zero,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      color: AppColors.primaryWhite,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.west),
                              iconSize: 24,
                              onPressed: () {
                                if(modal.activeIndex == 0) {
                                  Navigator.of(context).push(
                                    slideOutgoingRight(
                                      enterPage: MainScreen(), exitPage: RegisterModal(),
                                    ),
                                  );
                                } else {
                                  Provider.of<UserModal>(context, listen: false).decrementStep(context);
                                  // slideOutgoingRight(
                                  // enterPage: Provider.of<UserModal>(context, listen: false).decrementStep(context); exitPage: modal.activeIndex
                                  // context: context,
                                  // exitPage: RegisterModal(), // Add the current page widget
                                  // enterPage: RegisterModal(),
                                  // );
                                  
                                }
                              }
                            ),
                            IconButton(
                              icon: Icon(Icons.close),
                              iconSize: 24,
                              onPressed: () {
                                Navigator.of(context).push(
                                  slideOutgoingDown(
                                    enterPage: MainScreen(), exitPage: RegisterModal(),
                                  ),
                                );
                              }
                            ),
                          ]
                        )
                      )
                    ),
                  ]
                )
              );
            },
          ),
          Expanded(
            child: Selector<UserModal, int>(
              selector: (_, modal) => modal.activeIndex,
              builder: (context, activeIndex, _) {
                // Ensure activeIndex is fetched properly
                final currentStepContent = _getStepContent(activeIndex);

                // Trigger navigation only when activeIndex changes
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  // Navigator.of(context).pushReplacement(
                  //   PageRouteBuilder(
                  //     pageBuilder: (context, animation, secondaryAnimation) {
                  //       return currentStepContent;
                  //     },
                      // transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      //   const begin = Offset(0.0, 1.0); // Slide from bottom
                      //   const end = Offset.zero;       // Slide to center
                      //   const curve = Curves.easeInOut;

                      //   final tween = Tween(begin: begin, end: end)
                      //       .chain(CurveTween(curve: curve));
                      //   final offsetAnimation = animation.drive(tween);

                        // return SlideTransition(
                        //   position: offsetAnimation,
                        //   child: child,
                        // );
                      // },
                    // ),
                  // );
                });

                // Return current step content without wrapping it in navigation logic
                return currentStepContent;
              },
            ),
          ),
          Consumer<UserModal>(
            builder: (context, modal, child) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if(modal.activeIndex == 5) { //push outside of register steps, last step
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => AppTab()),
                            );
                          } else if(modal.activeIndex == 4) { //exception for controller-less pages (can't be validated but are valid steps)
                            //permission dialogue (location)
                            showDialog(
                              context: context,
                              builder: (context) => PermissionDialog(),
                            );
                          } if(modal.isStepValid && modal.activeIndex <= 3) { //validation for controllable pages
                            Provider.of<UserModal>(context, listen: false).restartEvaluating();
                            Provider.of<UserModal>(context, listen: false).incrementStep(context);
                          } else {
                            null;
                          }
                        },
                        style: !Provider.of<UserModal>(context).isStepValid && modal.activeIndex != 4 && modal.activeIndex != 5
                        ? ButtonStyles.elevatedButton(backgroundColor: AppColors.buttonDisabled12) 
                        : ButtonStyles.elevatedButton(backgroundColor: AppColors.primaryGold60),
                        child: Text(
                          modal.activeIndex == 4 ?  'Activate permissions' : 'Next',
                          style: Provider.of<UserModal>(context).isStepValid
                          ? TextStyles.elevatedButtonText(color: AppColors.primaryBlack) 
                          : TextStyles.elevatedButtonText(color: AppColors.primaryGray10),
                        ),
                      ),
                    SizedBox(height: 40),
                  ]
                )
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _getStepContent(int activeIndex) {
    switch (activeIndex) {
      case 0:
        return ProfileName();
      case 1:
        return PhoneOrEmail();
      case 2:
        return Token();
      case 3:
        return Password();
      case 4:
        return Permissions();
      case 5:
        return SuggestedProfiles();
      default:
        return ProfileName();
    }
  }
}
