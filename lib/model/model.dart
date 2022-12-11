import 'dart:convert';

List<User> UserFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String UserToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String email = "";
  String username = "";
  String name = "";
  String password = "";
  String role = "";

  User(
      {required this.username,
      required this.name,
      required this.email,
      required this.password,
      required this.role});

  factory User.fromJson(Map<String, dynamic> json) => User(
      username: json["username"],
      name: json["name"],
      email: json["email"],
      password: json["password"],
      role: json["role"]);
  Map<String, dynamic> toJson() => {
        "username": username,
        "name": name,
        "email": email,
        "password": password,
        "role": role,
      };
}
