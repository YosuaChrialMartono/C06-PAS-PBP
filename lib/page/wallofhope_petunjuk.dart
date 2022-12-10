import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/page/wallofhope_menu.dart';


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
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bulb.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
            padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }
}