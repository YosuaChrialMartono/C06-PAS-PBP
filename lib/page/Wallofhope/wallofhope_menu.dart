import 'package:c06_pas_pbp/page/wallofhope/wallofhope_petunjuk.dart';
import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/drawer.dart';
import 'package:c06_pas_pbp/page/wallofhope/wallofhope.dart';
import 'package:c06_pas_pbp/page/wallofhope/form_wallofhope.dart';
import 'package:c06_pas_pbp/page/login.dart';

class wallofhopeMenuPage extends StatefulWidget {
  const wallofhopeMenuPage({super.key});

  final String title = 'Wall Of Hope Menu';

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
          backgroundColor: Color(0xffAA8B56),
        ),
        drawer: const PTS_Drawer(),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff4E6C50), Color(0xffaa8b56)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          )),
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  "Wall Of Hope Menu",
                  style: TextStyle(
                    color: Colors.white,
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
              if (LoginState.loggedIn == true) ...[
                if (LoginState.userRole == "PASIEN") ...[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const formWallofhopePage(),
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
                          child:
                              const Text("Petunjuk Pembuatan Wall Of Hope"))),
                ]
              ]
            ),
          ),
        ));
  }
}
