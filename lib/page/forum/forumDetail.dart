import 'package:c06_pas_pbp/drawer.dart';
import 'package:c06_pas_pbp/model/article.dart';
import 'package:c06_pas_pbp/model/comment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ForumDetailPage extends StatefulWidget {
  const ForumDetailPage({super.key, required this.modelForum});
  final Comment modelForum;

  @override
  State<ForumDetailPage> createState() => _ForumDetailPageState(modelForum);
}

class _ForumDetailPageState extends State<ForumDetailPage> {
  Comment model;
  _ForumDetailPageState(this.model);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(model.id.toString()),
        backgroundColor: const Color(0xffAA8B56),
        centerTitle: true,
      ), // Menambahkan drawer menu
      drawer: const PTS_Drawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff4E6C50), Color(0xffaa8b56)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        )),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  model.id.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Color(0xfff0ebce)),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 4),
              child: Row(
                children: [
                  const Text(
                    "Release at: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xfff0ebce),
                    ),
                  ),
                  Text(
                    DateFormat.yMMMd()
                        .format(DateTime.parse(model.date.toString())),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xfff0ebce),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 4),
              child: Row(
                children: [
                  const Text(
                    "Author: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xfff0ebce),
                    ),
                  ),
                  Text(
                    '${model.author}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xfff0ebce),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                        child: Text(
                      model.content.toString(),
                      style: TextStyle(color: Color(0xfff0ebce)),
                    ))
                  ],
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: Size(100, 45),
                      backgroundColor: Color(0xffAA8B56)),
                  child: Text(
                    'Back',
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xfff0ebce)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
