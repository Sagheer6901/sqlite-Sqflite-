import 'dart:convert';

class UserProfile {

  int id;
  String name;
  String email;
  String password;


  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email_id': email,
      'password': password,
    };
  }
  Map<String, dynamic> toUpsertMap() {
    return {
      'name': name,
      'email_id': email,
      'password': password,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id']?.toInt() ?? 0,
      name: map['name']?.toString() ?? "",
      email: map['email_id']?.toString() ?? "",
      password: map['password']?.toString() ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) => UserProfile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserProfile(id: $id, name: $name, email_id: $email, password: $password)';
  }


}
