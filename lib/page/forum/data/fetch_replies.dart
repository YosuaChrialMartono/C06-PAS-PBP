import 'package:c06_pas_pbp/page/forum/data/comment.dart';
import 'package:c06_pas_pbp/page/forum/endpoints.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchReplies {
  Future<List<Comment>> fetchReplies(int id) async {
    try {
      final List<Comment> result = [];
      var response = await http.get(
        Uri.parse(EndPoints.getForum),
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json",
        },
      );

      var data = jsonDecode(utf8.decode(response.bodyBytes));

      for (var d in data) {
        Comment reply = Comment.fromJson(d);
        reply.id = d['pk'];
        result.add(reply);
      }
      return result;
    } catch (e) {
      throw Exception('error: $e');
    }
  }
}
