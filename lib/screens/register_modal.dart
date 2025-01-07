import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/route/page_slide_animation.dart';

import 'package:test_olliefy/modal/user_modal.dart';
import 'package:test_olliefy/modal/register_steps.dart';
import 'package:test_olliefy/screens/map.dart';
import 'package:test_olliefy/screens/main_screen.dart';
import 'package:test_olliefy/screens/profile/user_profile.dart';

class RegisterModal extends StatefulWidget {
  const RegisterModal({super.key});

  @override
  _RegisterModalState createState() => _RegisterModalState();
}

class _RegisterModalState extends State<RegisterModal> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserModal>(
      create: (context) => UserModal(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryGold60,
          toolbarHeight: 48,
        ),
        backgroundColor: AppColors.primaryWhite,
        body: Column(
          children: [
            Consumer<UserModal>(
              builder: (context, modal, child) {
                return Container(
                  child: Column(
                    children: [
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
                                      pageSlideAnimation(
                                        MainScreen(), 
                                      ),
                                    );
                                  } else {
                                    Provider.of<UserModal>(context, listen: false).decrementStep(context);
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
              child: Consumer<UserModal>(
                builder: (context, modal, child) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;
                      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                      final offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  child: _getStepContent(modal.activeIndex),
                  );
                  
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
                            if(modal.isStepValid && modal.activeIndex < 4) {
                              Provider.of<UserModal>(context, listen: false).restartEvaluating();
                              Provider.of<UserModal>(context, listen: false).incrementStep(context);
                            } else if(modal.activeIndex == 4) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) => UserProfile()),
                                );
                              }
                            else {
                              null;
                            }
                          },
                          style: !Provider.of<UserModal>(context).isStepValid && modal.activeIndex < 4
                          ? ButtonStyles.elevatedButton(backgroundColor: AppColors.buttonDisabled12) 
                          : ButtonStyles.elevatedButton(backgroundColor: AppColors.primaryGold60),
                          child: Text(
                          modal.activeIndex == 4 ?  'Activate permissions' : 'Next',
                          style: Provider.of<UserModal>(context).isStepValid
                          ? TextStyles.elevatedButtonText(color: AppColors.primaryBlack) 
                          : TextStyles.elevatedButtonText(color: AppColors.primaryGray50),
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
      ),
    );
  }

  Widget _getStepContent(int stepIndex) {
    switch (stepIndex) {
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
      default:
        return ProfileName();
    }
  }
}
