import 'routine_model.dart';

class User {
  final String id;
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        email: json['email'],
        username: json['username'],
        password: json['pw_hash'],
        routines: List<Routine>.from(json['routines']));
  }
}
