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

class AuthGate extends StatefulWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  _AuthGateState createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  late final Future<void> _initFuture;

  @override
  void initState() {
    super.initState();
    _initFuture = _initializeFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initFuture,
      builder: (context, initSnapshot) {
        if (initSnapshot.connectionState != ConnectionState.done) {
          return const Splashscreen();
        }
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, authSnapshot) {
            final loggedIn = authSnapshot.hasData;
            final Widget next = loggedIn
                ? AppTab(key: const ValueKey('app_tab'), initialIndex: 1)
                : MainScreen(key: const ValueKey('main_screen'));
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
    
    await Future.delayed(const Duration(milliseconds: 1500));  
    splashProgress.value = 1.0;
  }
}
