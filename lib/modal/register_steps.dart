import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/screens/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileName extends StatefulWidget {
  @override
  _ProfileNameState createState() => _ProfileNameState();
}

class _ProfileNameState extends State<ProfileName> {
final TextEditingController _usernameController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_checkIfEmpty);
  }

  void _checkIfEmpty() {
    setState(() {
      _isButtonEnabled = _usernameController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
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
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      pageBuilder:(context, animation, secondaryAnimation) => PhoneOrEmail(),
                    )
                  );
                },
                child: Text('phone or email screen')
              ),
              Container(
                //back and close button
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: RichText(
                  text:TextSpan(style: GoogleFonts.openSans(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black), children: [
                    TextSpan(text:'Choose a name for your profile'),
                  ])
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 450),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                  controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ), 
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 450),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: _isButtonEnabled ? () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => PhoneOrEmail()),
                      );
                    } : null,
                    // onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isButtonEnabled ? AppColors.primaryGold60 : AppColors.buttonDisabled12,
                      minimumSize: Size(350, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _isButtonEnabled ? AppColors.black : AppColors.primaryGray50),
                            children: [
                              TextSpan(text: 'Next'),
                            ],
                          ),
                        ),
                      ]
                    )
                  ),
                ),
              ),
            ]
          )
        )
      ),
    );
  }
}

class PhoneOrEmail extends StatelessWidget {
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
                  pageBuilder:(context, animation, secondaryAnimation) => Password(),
                )
              );
            },
            child: Text('password screen')
          )
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