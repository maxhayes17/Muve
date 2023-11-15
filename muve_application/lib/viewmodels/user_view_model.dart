import "package:flutter/material.dart";
import "package:muve_application/models/routine_model.dart";
import "package:muve_application/models/user_model.dart";
import "package:muve_application/viewmodels/routine_view_model.dart";

// FAKE DATA
import "package:muve_application/data.dart";

class UserViewModel with ChangeNotifier {
  User? _user;

  User? get user => _user;

  String? get username => _user?.username;
  int? get id => _user?.id;
  List<Routine>? get routines => _user?.routines;

  bool authenticateUser(String email, String password) {
    for (var user in users){
      if (user.email == email && user.password == password) {
        _user = user;
        notifyListeners();
        return true;
      }
    }
    return false;
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
