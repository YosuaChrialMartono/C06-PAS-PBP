// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory User.fromJson(Map<String, dynamic> json) => User(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.password,
    required this.lastLogin,
    required this.role,
    required this.email,
    required this.username,
    required this.nama,
    required this.isSubscribed,
    required this.isAdmin,
    required this.isActive,
    required this.isStaff,
    required this.isSuperuser,
  });

  String password;
  DateTime lastLogin;
  String role;
  String email;
  String username;
  String nama;
  bool isSubscribed;
  bool isAdmin;
  bool isActive;
  bool isStaff;
  bool isSuperuser;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        password: json["password"],
        lastLogin: DateTime.parse(json["last_login"]),
        role: json["role"],
        email: json["email"],
        username: json["username"],
        nama: json["nama"],
        isSubscribed: json["is_subscribed"],
        isAdmin: json["is_admin"],
        isActive: json["is_active"],
        isStaff: json["is_staff"],
        isSuperuser: json["is_superuser"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "last_login": lastLogin.toIso8601String(),
        "role": role,
        "email": email,
        "username": username,
        "nama": nama,
        "is_subscribed": isSubscribed,
        "is_admin": isAdmin,
        "is_active": isActive,
        "is_staff": isStaff,
        "is_superuser": isSuperuser,
      };
}
