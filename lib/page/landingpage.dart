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
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xfff0ebce))),
      ),
      body: Container(),
    );
  }
}
