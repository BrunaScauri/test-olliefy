import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_olliefy/utils/styles/fields.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';

import 'package:test_olliefy/services/user_modal.dart';

class ProfileName extends StatefulWidget {
  final GlobalKey<FormState> usernameFormKey;

  @override
  _ProfileNameState createState() => _ProfileNameState();

  const ProfileName({
    required this.usernameFormKey,
    Key? key,  
  }) : super(key: key);
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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 370),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: RichText(
                  text:TextSpan(style: TextStyles.primaryHeader(), children: [
                    TextSpan(text:'Choose a name for your profile'),
                  ])
                ),
              ),
              const SizedBox(height: 20),
              Consumer<UserModal>(
                builder: (context, modal, child) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: widget.usernameFormKey,
                      child: TextFormField(
                        controller: _profileNameController,
                        validator: (value) {
                          if(value!.length < 8) return 'Username must be at least 8 characters.';
                          if(!modal.isValidUsername) return 'Invalid username format. Please use only letters (a-z), numbers, periods or underscores.';
                          return null;
                        },
                        onChanged: (value) {
                          modal.updateProfileName(value);
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