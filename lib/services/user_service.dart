import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final _users = FirebaseFirestore.instance.collection('users');

  Future<bool> doesPhoneExist(String phoneNumber) async {
    final snap = await _users
        .where('phoneNumber', isEqualTo: phoneNumber)
        .limit(1)
        .get();
    return snap.docs.isNotEmpty;
  }

  Future<bool> doesEmailExist(String email) async {
    final snap = await _users
        .where('email', isEqualTo: email)
        .limit(1)
        .get();
    return snap.docs.isNotEmpty;
  }

  Future<bool> doesUsernameExist(String username) async {
    final snap = await _users
        .where('username', isEqualTo: username)
        .limit(1)
        .get();
    return snap.docs.isNotEmpty;
  }

}
