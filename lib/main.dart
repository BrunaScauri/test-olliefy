import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:media_kit/media_kit.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:test_olliefy/screens/splashscreen.dart';
import 'package:test_olliefy/modal/user_modal.dart';

//determine if the app is running on an emulator or a real device
Future<String> _determineHost() async {
  if (Platform.isAndroid) {
    final info = await DeviceInfoPlugin().androidInfo;
    final isEmulator = info.fingerprint.startsWith('generic') == true
        || info.model.toLowerCase().contains('emulator') == true;
    return isEmulator ? '10.0.2.2' : '192.168.15.9';
  }
  return 'localhost';
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //setup for firebase emulator
  final String host = await _determineHost();
  FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
  FirebaseAuth.instance.useAuthEmulator(host, 9099);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModal()),
      ],
      child: OlliefyApp(),
    ),
  );
}
class OlliefyApp extends StatelessWidget {
  const OlliefyApp({super.key});

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