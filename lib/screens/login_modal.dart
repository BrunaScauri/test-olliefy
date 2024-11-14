import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_olliefy/screens/map.dart';

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
        color: AppColors.white,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
              width: 40
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                'LOG IN',
                style: GoogleFonts.openSans(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(132, 129, 117, 1),
                  letterSpacing: 3.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Phone, email or username',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: _isButtonEnabled ? () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Map()),
              );
            } : null,
            // onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: Size(350, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _isButtonEnabled ? AppColors.white : AppColors.black),
                    children: [
                      TextSpan(text: 'Log in'),
                    ],
                  ),
                ),

              ]
            )
          ),
          const SizedBox(height: 10),
          Divider(height: 60, thickness: 0.8),
          ElevatedButton(
            onPressed: () {
              // Your onPressed logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              minimumSize: Size(350, 60),
              shadowColor: Colors.black,
              elevation: 3.0,
              // offset: Offset(0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/google_logo.png',
                  height: 12,
                  width: 12,
                ),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text: '  Continue with Google'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: Size(350, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/Apple_logo.svg',
                  colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white),
                    children: [
                      TextSpan(text: '  Continue with Apple'),
                    ],
                  ),
                ),

              ]
            )
          ),
          const SizedBox(height: 30),
          RichText(
            text: TextSpan(
              style: GoogleFonts.openSans(fontSize: 14, color: Colors.black),
              children: [
                TextSpan(text: 'By logging in, you are accepting our ',
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: 'Terms and Conditions ',
                    style: TextStyle(
                        color: Color.fromRGBO(134, 118, 32, 1),
                        fontWeight: FontWeight.w900)),
                TextSpan(text: 'as well as the '),
                TextSpan(
                    text: 'Privacy Policy.',
                    style: TextStyle(
                        color: Color.fromRGBO(134, 118, 32, 1),
                        fontWeight: FontWeight.w900)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
