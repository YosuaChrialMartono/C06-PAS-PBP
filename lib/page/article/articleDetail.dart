import 'package:c06_pas_pbp/drawer.dart';
import 'package:c06_pas_pbp/model/article.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class MyDetailPage extends StatefulWidget {
  const MyDetailPage({super.key, required this.modelArtikel});
  final Articles modelArtikel;

  @override
  State<MyDetailPage> createState() => _MyDetailPageState(modelArtikel);
}

class _MyDetailPageState extends State<MyDetailPage> {
  final _formKey = GlobalKey<FormState>();
  Articles model;
  String _author = "";
  _MyDetailPageState(this.model);
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    Future<void> getAuthor() async {
      final response = await request.get(
          'https://pts-c06-pbp.up.railway.app/auth/show-user-json-id/${model.fields.author}');

      final String author = await response[0]["fields"]["nama"];
      print(author.toString());
      setState(() {
        _author = author;
      });
    }

    getAuthor();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(model.pk),
        backgroundColor: Color(0xffAA8B56),
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
                  model.pk,
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
                    DateFormat.yMMMd().format(model.fields.date),
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
                    '${_author}',
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
                      model.fields.content,
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
