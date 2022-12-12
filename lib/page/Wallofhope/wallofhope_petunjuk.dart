import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/page/wallofhope/wallofhope_menu.dart';
import 'package:c06_pas_pbp/drawer.dart';

// ignore: camel_case_types
class wallofhopePetunjukPage extends StatefulWidget {
  const wallofhopePetunjukPage({super.key});

  final String title = 'Wall Of Hope';

  @override
  State<wallofhopePetunjukPage> createState() => _wallofhopePetunjukPage();
}

// ignore: camel_case_types
class _wallofhopePetunjukPage extends State<wallofhopePetunjukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petunjuk Pembuatan Wall of Hope'),
      ),
      drawer: const PTS_Drawer(),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://user-images.githubusercontent.com/112499670/199527490-1c813ab3-6414-4b63-b8ad-b9e5c1cb8c8f.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
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
          )),
    );
  }
}
