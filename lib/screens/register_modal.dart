import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_olliefy/services/user_service.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/route/slide_outgoing_down.dart';
import 'package:test_olliefy/utils/route/slide_outgoing_right.dart';

import 'package:test_olliefy/services/user_modal.dart';
import 'package:test_olliefy/screens/register_user/profile_name.dart';
import 'package:test_olliefy/screens/register_user/phone_or_email.dart';
import 'package:test_olliefy/screens/register_user/token.dart';
import 'package:test_olliefy/screens/register_user/password.dart';
import 'package:test_olliefy/screens/register_user/permissions.dart';
import 'package:test_olliefy/screens/register_user/suggested_profiles.dart';
import 'package:test_olliefy/screens/main_screen.dart';
import 'package:test_olliefy/screens/app_tab.dart';
import 'package:test_olliefy/components/atoms/permission_dialogue.dart';
import 'package:test_olliefy/utils/route/stepper_animation.dart';
import 'package:test_olliefy/utils/route/stepper_back_animation.dart';

class RegisterModal extends StatefulWidget {
  const RegisterModal({super.key});

  @override
  _RegisterModalState createState() => _RegisterModalState();
}

class _RegisterModalState extends State<RegisterModal> with SingleTickerProviderStateMixin {
  final _userService = UserService();
  final _usernameFormKey = GlobalKey<FormState>();
  final _emailFormKey = GlobalKey<FormState>();
  final _phoneNumberFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primaryGold60,
        toolbarHeight: 48,
        automaticallyImplyLeading: false
      ),
      body: Column(
        children: [
          Consumer<UserModal>(
            builder: (context, userModal, child) {
              return Container(
                child: Column(
                  children: [
                    //stepper indicator
                    Container(
                      color: AppColors.primaryGold60,
                      child: Row(
                        children: List.generate(userModal.totalIndex,
                          (index) => Expanded(
                            child: Container(
                              height: 8,
                              decoration: BoxDecoration(
                                color: index <= userModal.activeIndex
                                    ? AppColors.primaryGold20Stepper
                                    : AppColors.primaryGold10,
                                border: Border.all(
                                  color: index == userModal.activeIndex
                                      ? AppColors.primaryGold60
                                      : AppColors.primaryGold40,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: index == 0 ? Radius.circular(40) : Radius.zero,
                                  topRight: index == userModal.totalIndex - 1 ? Radius.circular(40) : Radius.zero,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    //logic for 'back' and 'close' buttons
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
                                if(userModal.activeIndex == 0) {
                                  Navigator.of(context).push(
                                    slideOutgoingRight(
                                      enterPage: MainScreen(), exitPage: RegisterModal(),
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
                                Navigator.of(context).pushReplacement(
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
          //animation for the stepper
          Expanded(
            child: Consumer<UserModal>(
              builder: (context, modal, child) {
                Widget currentStep = _getStepContent(modal.activeIndex);
                Widget? previousStep = modal.activeIndex > 0 ? _getStepContent(modal.activeIndex - 1) : null;
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    if (modal.activeIndex == 0) {
                      return child;
                    } else if (modal.isNextStep) {
                      return stepperAnimation(child, animation, previousChild: previousStep);
                    } else {
                      return stepperBackAnimation(child, animation, previousChild: previousStep);
                    }
                  },
                  child: KeyedSubtree(
                    key: ValueKey(modal.activeIndex),
                    child: currentStep,
                  ),
                );
              },
            ),
          ),
          //logic and styling for 'next'/'activate permissions' button
          Consumer<UserModal>(
            builder: (context, modal, child) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: AppColors.primaryWhite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          //existence checks on db for username page
                          if(modal.activeIndex == 0) {
                            if(!(_usernameFormKey.currentState?.validate() ?? false)) {
                              return;
                            }
                            if(await _userService.doesUsernameExist(modal.username)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('This username is already taken.')),
                              );
                              return;
                            } else {
                              Provider.of<UserModal>(context, listen: false).restartEvaluating();
                              Provider.of<UserModal>(context, listen: false).incrementStep(context);
                            }
                          }
                          if(modal.activeIndex == 5) { //push outside of register steps, last step
                            Navigator.of(context).pushReplacement(
                              slideOutgoingDown(
                                enterPage: AppTab(), exitPage: RegisterModal(),
                              ),
                            );
                          } else if(modal.activeIndex == 4) { //exception for controller-less pages (can't be validated but are valid steps)
                            //permission dialogue (location)
                            showDialog(
                              context: context,
                              builder: (context) => PermissionDialog(),
                            );
                          } 
                          if(modal.isStepValid && modal.activeIndex == 3 || modal.activeIndex == 2) { //validation for controllable pages
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
                    ]
                  )
                )
              );
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _getStepContent(int activeIndex) {
    switch (activeIndex) {
      case 0:
        return ProfileName(formKey: _usernameFormKey);
      case 1:
        return PhoneOrEmail(emailFormKey: _emailFormKey, phoneNumberFormKey: _phoneNumberFormKey);
      case 2:
        return Token();
      case 3:
        return Password();
      case 4:
        return Permissions();
      case 5:
        return SuggestedProfiles();
      default:
        return ProfileName(formKey: _usernameFormKey);
    }
  }
}
