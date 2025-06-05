import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/emulator_host.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:test_olliefy/firebase_options.dart';
import 'package:app_links/app_links.dart';
import 'dart:async';

import 'package:test_olliefy/screens/splashscreen.dart';
import 'package:test_olliefy/screens/app_tab.dart';
import 'package:test_olliefy/screens/main_screen.dart';
import 'package:test_olliefy/services/auth_service.dart';

final ValueNotifier<double> splashProgress = ValueNotifier(0);

class AuthGate extends StatefulWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  _AuthGateState createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  late final Future<void> _initFuture;
  StreamSubscription<Uri?>? _sub;

  Future<void> _initializeFirebase() async {
    splashProgress.value = 0.0;
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    splashProgress.value = 0.5;
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    splashProgress.value = 0.8;
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    splashProgress.value = 1.0;

  //handle app's cold start (login from email link)
  Future<void> _handleInitialUri() async  {
    try {
      final String? initialLink = await AppLinks().getInitialLinkString();
      if(initialLink != null) {
        authService.value.completeSignInWithEmailLink(initialLink.toString());
      }
    } on PlatformException {
      // ignore wrong uri
    } on FormatException {
      // ignore wrong uri
    }
  }

  @override
  void initState() {
    super.initState();
    _initFuture = _initializeFirebase();
    _handleInitialUri();
    _sub = AppLinks().uriLinkStream.listen((Uri? uri) {
      if(uri != null) {
        final linkString = uri.toString();
        authService.value.completeSignInWithEmailLink(linkString);
      }
    }, onError: (err) {
      null;
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
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
}
