class Comment {
  int? id;
  String? author;
  String? parent;
  String? date;
  bool? isThread;
  String? title;
  String? content;
  int? replies;

  Comment({
    this.id,
    this.author,
    this.parent,
    this.date,
    this.isThread,
    this.title,
    this.content,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    parent = json['parent'];
    date = json['date'];
    isThread = json['is_thread'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'author': author,
      'parent': parent,
      'date': date,
      'is_thread': isThread,
      'title': title,
      'content': content,
    };
    return data;
  }

  @override
  String toString() {
    return "{$id, $author, $parent, $date, $isThread, $title, $content}";
  }
}
