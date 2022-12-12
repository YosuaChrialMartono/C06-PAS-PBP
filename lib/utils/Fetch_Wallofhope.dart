import 'package:c06_pas_pbp/model/Model_Wallofhope.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<List<Wallofhope>> fetchwallofhope(request) async {
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

   