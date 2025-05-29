import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

ValueNotifier<AuthService> authService = ValueNotifier(AuthService());

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;
  // String? get userId => firebaseAuth.currentUser?.uid;
  // String? get userEmail => firebaseAuth.currentUser?.email;
  // String? get userName => firebaseAuth.currentUser?.displayName;
  // String? get userPhotoUrl => firebaseAuth.currentUser?.photoURL;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );
  
  Future<UserCredential?> signInWithGoogle() async {
    try{
      final googleUser = await GoogleSignIn().signIn();
      if(googleUser == null) {
        return null;
      }
      final googleAuth = await googleUser.authentication;
      final cred = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      return await _auth.signInWithCredential(cred);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  signInUserByPhone({required String phone}) async {
    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 120),
      verificationCompleted: (cred) async {
        await FirebaseAuth.instance.signInWithCredential(cred);
      },
      verificationFailed: (FirebaseAuthException e) {
      },
      codeSent: (String verificationId, int? resendToken) async {
         _myVerificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _myVerificationId = verificationId;
      },  
    );
  }

  Future<UserCredential> signInWithSmsCode({
    verificationId,
    smsCode
  }) {
    final credential = PhoneAuthProvider.credential(
      verificationId: _myVerificationId,
      smsCode: smsCode,
    );
    return _auth.signInWithCredential(credential);
  }
  }
}