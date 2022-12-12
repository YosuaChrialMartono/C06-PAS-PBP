import 'package:c06_pas_pbp/page/login.dart';
import 'package:c06_pas_pbp/page/signin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyLandingPage());
}

class MyLandingPage extends StatelessWidget {
  const MyLandingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pacil Tau Stunting',
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Pacil Tau Stunting',
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff395144))),
          backgroundColor: Color(0xfff0ebce)),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff4E6C50), Color(0xffaa8b56)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        )),
      ),
    );
  }
}
