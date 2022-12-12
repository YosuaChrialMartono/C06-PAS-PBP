import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Tracker {
  Tracker({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Tracker.fromJson(Map<String, dynamic> json) => Tracker(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };

  static Future<List<Tracker>> fetchMyTracker() async {
    final response = await http.get(Uri.parse('https://pts-c06-pbp.up.railway.app/tracking/json/'));

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<Tracker> listMyTracker = [];
    for (var i in data) {
      if (i != null) {
        listMyTracker.add(Tracker.fromJson(i));
      }
    }

    return listMyTracker;
  }
}

class Fields {
  Fields({
    required this.email,
    required this.age,
    required this.gender,
    required this.headCircumference,
    required this.height,
    required this.weight,
    required this.description,
  });

  String email;
  int age;
  String gender;
  int headCircumference;
  int height;
  int weight;
  String description;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    email: json["email"],
    age: json["age"],
    gender: json["gender"],
    headCircumference: json["head_circumference"],
    height: json["height"],
    weight: json["weight"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "age": age,
    "gender": gender,
    "head_circumference": headCircumference,
    "height": height,
    "weight": weight,
    "description": description,
  };
}

enum Model { TRACKER_TRACKERPAGE }

final modelValues =
EnumValues({"article.Trackerpage": Model.TRACKER_TRACKERPAGE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
