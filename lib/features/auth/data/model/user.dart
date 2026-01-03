import 'dart:convert';

class User {
  int? id;
  String email;
  String password;
  String? username;
  List<int>? phoneNumbers;

  User({
    this.id,
    required this.email,
    required this.password,
    this.username,
    this.phoneNumbers,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'password': password,
      'username': username,
      'phoneNumbers': phoneNumbers,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] as String,
      password: map['password'] as String,
      username: map['username'] != null ? map['username'] as String : null,
      phoneNumbers: map['phoneNumbers'] != null
          ? List<int>.from((map['phoneNumbers'] as List).map((e) => e as int))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    int? id,
    String? email,
    String? password,
    String? username,
    List<int>? phoneNumbers,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      phoneNumbers: phoneNumbers ?? this.phoneNumbers,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, email: $email, password: $password, username: $username, phoneNumbers: $phoneNumbers)';
  }
}
