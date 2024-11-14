import 'package:flutter/material.dart';
import 'package:test_olliefy/screens/splashscreen.dart';
import 'package:test_olliefy/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Olliefy Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme()
      ),
      home: const Splashscreen(),
    );
  }
}