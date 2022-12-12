// To parse this JSON data, do
//
//     final wallofhope = wallofhopeFromJson(jsonString);

import 'dart:convert';
import 'package:c06_pas_pbp/model/Model_Wallofhope.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<Wallofhope> wallofhopeFromJson(String str) => List<Wallofhope>.from(json.decode(str).map((x) => Wallofhope.fromJson(x)));

String wallofhopeToJson(List<Wallofhope> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Wallofhope {
    Wallofhope({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Wallofhope.fromJson(Map<String, dynamic> json) => Wallofhope(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
    static Future<List<Wallofhope>> fetchwallofhope() async {
    var url = Uri.parse('https://pts-c06-pbp.up.railway.app/wallofhope/json/');
    var response = await http.get(
    url,
    headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
    },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<Wallofhope> listWallofhope = [];
    for (var d in data) {
    if (d != null) {
        listWallofhope.add(Wallofhope.fromJson(d));
    }
    }

    return listWallofhope;
}
}

class Fields {
    Fields({
        required this.user,
        required this.judul,
        required this.deskripsi,
        required this.image,
    });

    dynamic user;
    String judul;
    String deskripsi;
    String image;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "judul": judul,
        "deskripsi": deskripsi,
        "image": image,
    };
}
