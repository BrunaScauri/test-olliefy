import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_olliefy/utils/styles/prefix_flag.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/fields.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/styles/socials_button.dart';

import 'package:test_olliefy/services/user_modal.dart';

class PhoneOrEmail extends StatefulWidget {
  final GlobalKey<FormState> phoneNumberFormKey;
  final GlobalKey<FormState> emailFormKey;

  @override
  _PhoneOrEmailState createState() => _PhoneOrEmailState();

  const PhoneOrEmail({
    required this.phoneNumberFormKey,
    required this.emailFormKey,
    Key? key,  
  }) : super(key: key);
}

class _PhoneOrEmailState extends State<PhoneOrEmail> with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late TabController _tabController;
  String _currentFlag = '';
  
   void _updateFlag(String value) {
    if (value.length >= 3) {
      final prefix = value.substring(1, 3); //extract 2 first chars skipping "+"
      setState(() {
        _currentFlag = getImagePath(prefix) ?? _currentFlag;
      });
    } else {
      setState(() {
        _currentFlag = _currentFlag;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      Provider.of<UserModal>(context, listen: false).updateContactTab(_tabController.index);
    });
  }
  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Consumer<UserModal>(
          builder: (context, modal, child) {
            return Container(
              constraints: BoxConstraints(maxWidth: 370),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                    child: RichText(
                    text:TextSpan(style: TextStyles.primaryHeader(), children: [
                      TextSpan(text:'Add a phone number or email address'),
                      ])
                    ),
                  ),
                  const SizedBox(height: 20),
                  DefaultTabController(
                    initialIndex: 0,
                    length: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          Container(
                            width: 400,
                            child:TabBar(
                              controller: _tabController,
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
                            height: 270,
                            child: AnimatedBuilder(
                              animation: _tabController.animation!,
                              builder: (context, child) {
                                return Stack(
                                  children: [
                                    // email tab
                                    Opacity(
                                      opacity: 1.0 - _tabController.animation!.value,
                                      child: IgnorePointer(
                                        ignoring: _tabController.animation!.value != 0,
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10),
                                            Consumer<UserModal>(
                                              builder: (context, modal, child) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Form(
                                                    key: widget.emailFormKey,
                                                    child: TextFormField(
                                                      controller: _emailController,
                                                      onChanged: (value) {
                                                        modal.updateEmail(value);
                                                      },
                                                      decoration: FormDecorations.textFieldDecoration(
                                                        labelText: 'Email address',
                                                        prefixIcon: Icons.email_outlined,
                                                      ),
                                                      validator: (value) {
                                                        if(!modal.isValidEmail) return 'Invalid email format.';
                                                        return null;
                                                      }
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            Container(
                                              constraints: BoxConstraints(maxWidth: 340),
                                              child: Divider(height: 10, thickness: 0.8),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Column(
                                                children: [
                                                  CustomButtons.socialsButton(
                                                    backgroundColor: AppColors.primaryWhite,
                                                    assetPath: 'assets/google_logo.svg',
                                                    buttonText: 'Continue with Google',
                                                    textColor: AppColors.primaryBlack,
                                                    onPressed: () {
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
                                            )
                                          ]
                                        ),
                                      ),
                                    ),
                                    // phone tab
                                    Opacity(
                                      opacity: _tabController.animation!.value,
                                      child: IgnorePointer(
                                        ignoring: _tabController.animation!.value != 1,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  Form(
                                                    key: widget.phoneNumberFormKey,
                                                    child: TextFormField(
                                                      controller: _phoneController,
                                                      keyboardType: TextInputType.number,
                                                      inputFormatters: <TextInputFormatter>[
                                                        FilteringTextInputFormatter.digitsOnly,
                                                        MaskTextInputFormatter(
                                                          mask: '+## ### ### ###',
                                                        )
                                                      ],
                                                      validator: (value) {
                                                        return null;
                                                      },
                                                      onChanged: (value) {
                                                        _updateFlag(value);
                                                        modal.updatePhoneNumber(value);
                                                      },
                                                      //decoration for the flag icon
                                                      decoration: InputDecoration(
                                                        labelText: 'Phone number',
                                                        prefixIcon: _currentFlag == '' ? 
                                                        SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child: Center(
                                                            child: CircleAvatar(
                                                              radius: 25,
                                                              backgroundColor: Colors.transparent,
                                                              child: Image.asset(
                                                                'assets/default_flag.png',
                                                                fit: BoxFit.cover,
                                                              ),
                                                            )
                                                          ),
                                                        ) : 
                                                        SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child: Center(
                                                            child: CircleAvatar(
                                                              radius: 12,
                                                              backgroundImage: AssetImage(
                                                                _currentFlag,
                                                                package: 'country_icons',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        border: OutlineInputBorder(),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: AppColors.primaryGold70,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                              )
                                            )
                                          ]
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                        ]
                      )
                    )
                  ),  
                ]
              )
            );
          }
        ),
      ),
    );
  }
}