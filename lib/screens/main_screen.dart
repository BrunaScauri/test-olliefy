import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_olliefy/screens/login_modal.dart';
import 'package:test_olliefy/screens/register_modal.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Column(
    children: <Widget>[
      Expanded(
        child: Scaffold(
          backgroundColor: AppColors.primaryGold60,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 130),
                SvgPicture.asset(
                  'assets/skateboard_only_logo.svg',
                  colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                  height: 70,
                ),
                const SizedBox(height: 30),
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: RichText(
                    text:TextSpan(style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), children: [
                      TextSpan(text:'Get inspired, find spots, buy and sell.'),
                    ])
                  )
                  )
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(maxWidth: 450),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Amplify your skateboarding experience by finding spots and what people is doing.\nIn real time, anywhere in the world.', textAlign: TextAlign.left, style: TextStyle(fontSize: 16)
                    )
                  )
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                builder: (BuildContext context) {
                                  return LoginModal();
                                },
                              );
                            },
                            child: RichText(
                              text:TextSpan(style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), children: [
                                TextSpan(text:'Log in'),
                              ])
                            ),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.black, minimumSize: Size(320, 60), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                            )
                          )

                        ]
                      )
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              PageRouteBuilder(
                                pageBuilder:(context, animation, secondaryAnimation) => RegisterModal(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  const begin = Offset(1.0, 0.0);
                                  const end = Offset.zero;
                                  const curve = Curves.ease;
                                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                  var offsetAnimation = animation.drive(tween);
                                  return SlideTransition(
                                    position: offsetAnimation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: RichText(
                              text:TextSpan(style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), children: [
                                TextSpan(text:'Register'),
                              ])
                          ),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, minimumSize: Size(320, 60), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                          )
                        ),
                      ]
                      )
                    ),
                  ]
                ),
                Flexible(flex: 5, child: Container()),
                Container(
                  constraints: BoxConstraints(maxWidth: 450),
                  child: Image.asset(
                  'assets/main_screen.png',
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fill,
                  opacity: const AlwaysStoppedAnimation(.8),
                  width: MediaQuery.of(context).size.width,
                ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
}