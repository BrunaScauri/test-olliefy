class UserModal extends ChangeNotifier {
  final String? username;
  final String? email;
  final String? phoneNumber;
  final String? password;

  int activeIndex = 0;
  int totalIndex = 2;

}