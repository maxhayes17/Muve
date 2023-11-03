import "package:muve_application/models/user_model.dart";
import "package:muve_application/models/routine_model.dart";

class UserViewModel {

  User user;

  UserViewModel({required this.user});

  String get username => this.username;
  List<Routine> get routines => this.routines;

}