import 'package:flutter/material.dart';

class UserModal extends ChangeNotifier {
  String profileName = '';
  String email = '';
  String phoneNumber = '';
  String password = '';
  String token = '';
  
  int activeIndex = 0;
  final int _totalIndex = 3;
  bool _isValid = false;
  bool isNextStep = true;

  int get totalIndex => _totalIndex;
  bool get isStepValid => _isValid;

  bool get isValidUsername {
    final regex = RegExp(r'^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$');
    return regex.hasMatch(username);
  }

  void incrementStep(context) {
    isNextStep = true;
    if(activeIndex >= 0) {
      activeIndex++;
      notifyListeners();
    }
  }

  void decrementStep(BuildContext context) {
    isNextStep = false;
    if(activeIndex > 0) {
      activeIndex--;
      notifyListeners();
    } 
  }

  void updateProfileName(String value) {
    username = value;
    _isValid = username.isNotEmpty;
    notifyListeners();
  }

  void updateEmail(String value) {
    email = value;
    _isValid = value.isNotEmpty;
    notifyListeners();
  }

  void updatePhoneNumber(String value) {
    phoneNumber = value;
    _isValid = value.isNotEmpty;
    notifyListeners();
  }
  void updateToken(String value) {
    token = value;
    _isValid = value.isNotEmpty;
    notifyListeners();
  }

  void updatePassword(String value) {
    password = value;
    _isValid = value.isNotEmpty;
    notifyListeners();
  }

  void restartEvaluating() {
    _isValid = false;
    notifyListeners();
  }

  set isStepValid(bool value) {
    if(activeIndex == 4) {
      _isValid = true;
     notifyListeners();
    }
    _isValid = value;
    notifyListeners();
  }

}