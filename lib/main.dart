import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:test_olliefy/screens/splashscreen.dart';
import 'package:test_olliefy/screens/main_screen.dart';
import 'package:test_olliefy/modal/user_modal.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModal()),
      ],
      child: MyApp(),
    ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Olliefy Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryWhite,
          scrolledUnderElevation: 0.0,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryGold70),
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme(),
        scaffoldBackgroundColor: AppColors.primaryWhite,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppColors.primaryWhite,
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(AppColors.primaryWhite),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(AppColors.primaryGold70SwitchSettings),
          overlayColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.1)),
        ),
      ),
      home: const Splashscreen(),
    );
  }
}