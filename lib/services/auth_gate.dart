import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_olliefy/firebase_options.dart';
import 'package:test_olliefy/screens/splashscreen.dart';

import 'package:test_olliefy/utils/emulator_host.dart';
import 'package:test_olliefy/screens/app_tab.dart';
import 'package:test_olliefy/screens/main_screen.dart';

final ValueNotifier<double> splashProgress = ValueNotifier(0);

class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, initSnapshot) {
        if (initSnapshot.connectionState != ConnectionState.done) {
          return const Splashscreen();
        }
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, authSnapshot) {
            final Widget next = authSnapshot.hasData
                ? AppTab(initialIndex: 1)
                : MainScreen();
                //todo: fix animation not working
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              child: next,
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
        );
      },
    );
  }
  Future<void> _initializeFirebase() async {
    splashProgress.value = 0.0;
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
     splashProgress.value = 0.5;
    final host = await determineEmulatorHost();
    FirebaseAuth.instance.useAuthEmulator(host, 9099);
    FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
    Future.delayed(const Duration(milliseconds: 1500), () {});
    splashProgress.value = 0.8;
    await FirebaseAuth.instance.authStateChanges().first;
    splashProgress.value = 1.0;
  }
}
