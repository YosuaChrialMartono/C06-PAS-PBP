import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/page/signin.dart';
import 'package:c06_pas_pbp/page/landingpage.dart';

void main() {
  runApp(MyLoginPage());
}

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _username = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      key: _formKey,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xff4E6C50), Color(0xffaa8b56)],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Login",
              style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff395144))),
          Container(
            padding: const EdgeInsets.fromLTRB(50, 15, 50, 0),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xfff0ebce),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Username",
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(
                  Icons.person,
                  size: 30,
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _username = value!;
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xfff0ebce),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(
                  Icons.key,
                  size: 30,
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _password = value!;
                });
              },
            ),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(40, 15, 40, 10),
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
                    MaterialPageRoute(builder: (context) => MyLandingPage()),
                  );
                },
              )),
          Row(
            children: <Widget>[
              Text('Belum mempunyai akun?',
                  style: GoogleFonts.montserrat(fontSize: 15)),
              TextButton(
                child: Text(
                  'Sign in',
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff395144)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MySigninPage()),
                  );
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    ));
    throw UnimplementedError();
  }
}
