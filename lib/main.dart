import 'package:c06_pas_pbp/page/login.dart';
import 'package:c06_pas_pbp/page/signin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pacil Tau Stunting',
      home: MyHomePage(),
    ));

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.6,
                    child: Image.asset('assets/bg.jpg', fit: BoxFit.cover),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Color(0xfff0ebce),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/pbp.png',
                          width: 110,
                          height: 110,
                          //fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('PACIL TAU STUNTING',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xfff0ebce))),
                      Container(
                          padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                minimumSize: Size(100, 45),
                                backgroundColor: Color(0xffAA8B56)),
                            child: Text(
                              'Login',
                              style: GoogleFonts.montserrat(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyLoginPage()),
                              );
                            },
                          )),
                      Container(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                minimumSize: Size(100, 45),
                                backgroundColor: Color(0xffAA8B56)),
                            //backgroundColor: Color()),
                            child: Text(
                              'Sign in',
                              style: GoogleFonts.montserrat(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MySigninPage()),
                              );
                            },
                          )),
                    ],
                  ),
                ),
              ],
            )));
    throw UnimplementedError();
  }
}
