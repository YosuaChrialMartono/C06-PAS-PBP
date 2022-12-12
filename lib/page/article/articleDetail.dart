import 'package:c06_pas_pbp/drawer.dart';
import 'package:c06_pas_pbp/model/article.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDetailPage extends StatefulWidget {
  const MyDetailPage({super.key, required this.modelArtikel});
  final Articles modelArtikel;

  @override
  State<MyDetailPage> createState() => _MyDetailPageState(modelArtikel);
}

class _MyDetailPageState extends State<MyDetailPage> {
  Articles model;
  _MyDetailPageState(this.model);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ), // Menambahkan drawer menu
      drawer: const PTS_Drawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                model.pk,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  DateFormat.yMMMd().format(model.fields.date),
                  style: const TextStyle(fontSize: 14),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  '${model.fields.author}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
              padding:
                  const EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Flexible(child: Text(model.fields.content))],
              )),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size.fromHeight(40.0),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Back",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
