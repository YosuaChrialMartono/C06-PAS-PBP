import 'dart:convert';
import 'package:http/http.dart' as http;

List<Comment> commentFromJson(String str) =>
    List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentToJson(List<Comment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {
  int? author;
  Null? parent;
  String? date;
  bool? isThread;
  String? title;
  String? content;
  int? replies;

  Comment(
      {this.author,
      this.parent,
      this.date,
      this.isThread,
      this.title,
      this.content,
      this.replies});

  Comment.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    parent = json['parent'];
    date = json['date'];
    isThread = json['is_thread'];
    title = json['title'];
    content = json['content'];
    replies = json['replies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['parent'] = parent;
    data['date'] = date;
    data['is_thread'] = isThread;
    data['title'] = title;
    data['content'] = content;
    data['replies'] = replies;
    return data;
  }

  static Future<List<Comment>> fetchComments() async {
    var url = Uri.parse('https://pts-c06-pbp.up.railway.app/forum/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<Comment> listComments = [];
    for (var i in data) {
      if (i != null) {
        print(Comment.fromJson(i));
        listComments.add(Comment.fromJson(i));
      }
    }

    return listComments;
  }

  @override
  String toString() {
    return "{$author, $parent, $date, $isThread, $title, $content}";
  }
}
