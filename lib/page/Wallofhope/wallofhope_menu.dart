import 'package:c06_pas_pbp/page/wallofhope/wallofhope_petunjuk.dart';
import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/drawer.dart';
import 'package:c06_pas_pbp/page/wallofhope/wallofhope.dart';
import 'package:c06_pas_pbp/page/wallofhope/form_wallofhope.dart';

// ignore: camel_case_types
class wallofhopeMenuPage extends StatefulWidget {
  const wallofhopeMenuPage({super.key});

  final String title = 'Wall Of Hope';

  @override
  State<wallofhopeMenuPage> createState() => _wallofhopeMenuPage();
}

// ignore: camel_case_types
class _wallofhopeMenuPage extends State<wallofhopeMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const PTS_Drawer(),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    "Wall Of Hope Menu",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Roboto",
                      fontSize: 40,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const wallofhopePage(),
                          ),
                        );
                      },
                      child: const Text("Lihat Wall Of Hope")),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const formWallofhopePage(),
                            ),
                          );
                        },
                        child: const Text("Buat Wall Of Hope"))),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const wallofhopePetunjukPage(),
                            ),
                          );
                        },
                        child: const Text("Petunjuk Pembuatan Wall Of Hope"))),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: ElevatedButton(
                //   onPressed: () {
                //   Navigator.of(context).push(
                //         MaterialPageRoute(
                //           builder: (context) => const wallofhopeLinkPage(),
                //         ),
                //     );
                //   },
                //   child: const Text("Pembuatan Link Wall Of Hope"))
                // ),
              ],
            ),
          ),
        ));
  }
}
