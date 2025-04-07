import 'package:flutter/material.dart';

class UserModal extends ChangeNotifier {
  String _profileName = '';
  String _email = '';
  String _phoneNumber = '';
  String _password = '';
  String _token = '';
  
  int _activeIndex = 0;
  final int _totalIndex = 3;
  bool _isValid = false;
  bool isNextStep = true;

  int get activeIndex => _activeIndex;
  int get totalIndex => _totalIndex;

  bool get isStepValid => _isValid;

  void incrementStep(context) {
    isNextStep = true;
    if(_activeIndex >= 0) {
      _activeIndex++;
      notifyListeners();
    }
  }

  void decrementStep(BuildContext context) {
    isNextStep = false;
    if(_activeIndex > 0) {
      _activeIndex--;
      notifyListeners();
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
    // _isValid = emailRegExp.hasMatch(value);
    _isValid = value.isNotEmpty;
    notifyListeners();
  }

  void updatePhoneNumber(String value) {
    _phoneNumber = value;
    // _isValid = emailRegExp.hasMatch(value);
    _isValid = value.isNotEmpty;
    notifyListeners();
  }
  void updateToken(String value) {
    _token = value;
    _isValid = value.isNotEmpty;
    notifyListeners();
  }

  void updatePassword(String value) {
    // final emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    _password = value;
    _isValid = value.isNotEmpty;
    notifyListeners();
  }

  void restartEvaluating() {
    _isValid = false;
    notifyListeners();
  }

  set isStepValid(bool value) {
    if(_activeIndex == 4) {
      _isValid = true;
     notifyListeners();
    }
    _isValid = value;
    notifyListeners();
  }

}