import "package:flutter/material.dart";
import "package:muve_application/models/routine_model.dart";
import "package:muve_application/models/user_model.dart";
import "package:muve_application/viewmodels/routine_view_model.dart";

class UserViewModel with ChangeNotifier {
  final Map<String, User> _userList = _userDatabase;
  User? _user;

  User? get user => _user;

  String? get username => _user?.username;
  int? get id => _user?.id;
  List<Routine>? get routines => _user?.routines;

  bool authenticateUser(String email, String password) {
    if (_userList[email]?.password == password) {
      _user = _userList[email];
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
   // Assuming last 3 added routines are most recent... return last 3 routines
  List<Routine> getRecentRoutines(){
    if(_user!.routines!.length >= 3){
      return _user!.routines!.sublist(_user!.routines!.length - 3);
    }
    else{
      return _user!.routines!;
    }
  }


}

final Map<String, User> _userDatabase = {
  "jeremy@muve.com":
      User(id: 1, email: "jeremy@muve.com", username: "jeremy", password: "pw", routines: jeremyRoutineList),
  "max@muve.com":
      User(id: 2, email: "max@muve.com", username: "max", password: "pw", routines: maxRoutineList),
  "ethan@muve.com":
      User(id: 3, email: "ethan@muve.com", username: "ethan", password: "pw", routines: ethanRoutineList)
};
