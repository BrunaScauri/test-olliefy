import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:test_olliefy/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:media_kit/media_kit.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:test_olliefy/screens/splashscreen.dart';
import 'package:test_olliefy/modal/user_modal.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp();
  MediaKit.ensureInitialized();
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
          checkColor: WidgetStateProperty.all(AppColors.primaryWhite),
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(AppColors.primaryGold70SwitchSettings),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      home: const Splashscreen(),
    );
  }
}