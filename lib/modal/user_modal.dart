import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import 'package:test_olliefy/screens/main_screen.dart';

class UserModal extends ChangeNotifier {
  String _profileName = '';
  String _email = '';
  String _phoneNumber = '';
  String _password = '';
  
  int _activeIndex = 0;
  final int _totalIndex = 3;
  bool _isValid = false;

  int get activeIndex => _activeIndex;
  int get totalIndex => _totalIndex;

  bool get isStepValid => _isValid;

  void incrementStep(context) {
    if(_activeIndex >= 0 && _activeIndex <= 3) {
      _activeIndex++;
      notifyListeners();
    }
  }

  void decrementStep(BuildContext context) {
    if(_activeIndex > 0) {
      _activeIndex--;
      notifyListeners();
      //PLEASE LOOK INTO THIS
    } 
  }

  void updateProfileName(String value) {
    _profileName = value;
    _isValid = _profileName.isNotEmpty;
    notifyListeners();
  }

  void updateEmail(String value) {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    _email = value;

  // void updatePhoneNumber(String value) {
  //   final emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); 
  //   _email = value;
  //   _isValid = emailRegExp.hasMatch(value);
  //   notifyListeners();
  // }

  void updatePassword(String value) {
    // final emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    _email = value;
    _isValid = value.isNotEmpty;
    notifyListeners();
  }

  void restartEvaluating() {
    if(_activeIndex > 3) {
      _isValid = true;
     notifyListeners();
    } else {
    _isValid = false;
    notifyListeners();
    }
  }

  set isStepValid(bool value) {
    if(_activeIndex == 2) {
      _isValid = true;
     notifyListeners();
    }
    _isValid = value;
    notifyListeners();
  }

}