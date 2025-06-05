import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:media_kit/media_kit.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:test_olliefy/services/auth_gate.dart';
import 'package:test_olliefy/modal/user_modal.dart';
import 'package:test_olliefy/utils/emulator_host.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //setup for firebase emulator
  final host = await determineEmulatorHost();
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Olliefy Demo',
      home: AuthGate(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryWhite,
          scrolledUnderElevation: 0.0,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(58, 153, 254, 1)),
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
    );
  }
}