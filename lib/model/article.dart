// To parse this JSON data, do
//
//     final articles = articlesFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

List<Articles> articlesFromJson(String str) =>
    List<Articles>.from(json.decode(str).map((x) => Articles.fromJson(x)));

String articlesToJson(List<Articles> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Articles {
  Articles({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  String pk;
  Fields fields;

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };
  static Future<List<Articles>> fetchMyArticles() async {
    var url = Uri.parse('https://pts-c06-pbp.up.railway.app/article/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<Articles> listMyArticles = [];
    for (var i in data) {
      if (i != null) {
        listMyArticles.add(Articles.fromJson(i));
      }
    }

    return listMyArticles;
  }
}

class Fields {
  Fields({
    required this.author,
    required this.date,
    required this.content,
  });

  int author;
  DateTime date;
  String content;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        author: json["author"],
        date: DateTime.parse(json["date"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "content": content,
      };
}

enum Model { ARTICLE_ARTICLESPAGE }

final modelValues =
    EnumValues({"article.articlespage": Model.ARTICLE_ARTICLESPAGE});

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
