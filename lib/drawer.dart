import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/main.dart';
import 'package:c06_pas_pbp/page/wallofhope.dart';
import 'package:c06_pas_pbp/page/article/article.dart';
import 'package:c06_pas_pbp/page/tracker.dart';
import 'package:c06_pas_pbp/page/trackerFetch.dart';



class PTS_Drawer extends StatelessWidget {
  const PTS_Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        // Menambahkan clickable menu
        ListTile(
          title: const Text('Main'),
          onTap: () {
            // Route menu ke halaman utama
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
        ListTile(
          title: const Text('Wall of hope'),
          onTap: () {
            // Route menu ke halaman form
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const wallofhopePage()),
            );
          },
        ),
        ListTile(
          title: const Text('Artikel Stunting'),
          onTap: () {
            // Route ke page artikel
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyArticlePage()),
            );
          },
        ),
        ListTile(
          title: const Text('Tracker'),
          onTap: () {
            // Route ke page artikel
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const TrackerPage()),
            );
          },
        ),
        ListTile(
          title: const Text('Tracker Data'),
          onTap: () {
            // Route ke page artikel
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const TrackerData()),
            );
          },
        ),
      ],
    ));
  }
}
