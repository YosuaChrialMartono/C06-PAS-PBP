import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/page/wallofhope/wallofhope_menu.dart';
import 'package:c06_pas_pbp/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class wallofhopePetunjukPage extends StatefulWidget {
  const wallofhopePetunjukPage({super.key});

  final String title = 'Petunjuk Pembuatan Wall Of Hope';

  @override
  State<wallofhopePetunjukPage> createState() => _wallofhopePetunjukPage();
}

// ignore: camel_case_types
class _wallofhopePetunjukPage extends State<wallofhopePetunjukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xffAA8B56),
      ),
      drawer: const PTS_Drawer(),
      body: Stack(children: [
        Positioned.fill(
          child:Image.asset('assets/Petunjuk.png', fit: BoxFit.cover),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const wallofhopeMenuPage(),
                    ),
                  );
                },
                child: const Text(
                  'Kembali',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
