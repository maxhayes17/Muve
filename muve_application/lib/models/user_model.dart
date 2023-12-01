import 'routine_model.dart';

class User {
  final int id;
  final String email;
  final String username;
  final String password;
  final List<Routine>? routines;

  User(
      {required this.id,
      required this.email,
      required this.username,
      required this.password,
      this.routines});
}
