
class User {
  
  final String id;
  final String email;
  final String username;
  final String pw_hash;
  final List<String> routines;

  User({
    required this.id, 
    required this.email, 
    required this.username, 
    required this.pw_hash, 
    required this.routines
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      pw_hash: json['pw_hash'],
      routines: List<String>.from(json['routines'])
    );
  }

}