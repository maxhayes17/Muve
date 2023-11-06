import "package:flutter/material.dart";
import "package:muve_application/models/user_model.dart";

class UserViewModel with ChangeNotifier {
  final Map<String, User> _userList = _userDatabase;
  late User? _user;

  String? get username => _user?.username;
  int? get id => _user?.id;

  bool authenticateUser(String email, String password) {
    if (_userList[email]?.password == password) {
      _user = _userList[email];
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}

final Map<String, User> _userDatabase = {
  "jeremy@muve.com":
      User(id: 1, email: "jeremy@muve.com", username: "jeremy", password: "pw"),
  "max@muve.com":
      User(id: 2, email: "max@muve.com", username: "max", password: "pw"),
  "ethan@muve.com":
      User(id: 3, email: "ethan@muve.com", username: "ethan", password: "pw")
};
