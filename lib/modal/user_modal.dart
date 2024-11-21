import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class UserModal extends ChangeNotifier {
  String? username;
  String? email;
  String? phoneNumber;
  String? password;


  int activeIndex = 0;
  int totalIndex = 3;

  changeIndex(int index) {
    activeIndex = index;
    notifyListeners();
  }
}