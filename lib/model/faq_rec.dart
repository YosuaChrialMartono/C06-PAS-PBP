// To parse this JSON data, do
//
//     final faqRecommendations = faqRecommendationsFromJson(jsonString);

import 'dart:convert';

List<FaqRecommendations> faqRecommendationsFromJson(String str) =>
    List<FaqRecommendations>.from(
        json.decode(str).map((x) => FaqRecommendations.fromJson(x)));

String faqRecommendationsToJson(List<FaqRecommendations> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FaqRecommendations {
  FaqRecommendations({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory FaqRecommendations.fromJson(Map<String, dynamic> json) =>
      FaqRecommendations(
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
    required this.title,
    required this.description,
  });

  String title;
  String description;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}
