import 'package:c06_pas_pbp/drawer.dart';
import 'package:c06_pas_pbp/page/login.dart';
import 'package:c06_pas_pbp/page/signin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const MyHomePage(),
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.black),
        routes: {
          "/login": (BuildContext context) => const Login()
        }, // perhatikan lagi
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePage createState() => _MyHomePage();
  final String title = "Home";
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        drawer: const PTS_Drawer(),
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.5,
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
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xfff0ebce)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
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
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xfff0ebce)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MySignUpPage()),
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
