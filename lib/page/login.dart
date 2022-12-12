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
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.black),
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
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Login",
              style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          Container(
            padding: const EdgeInsets.fromLTRB(40, 15, 40, 0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Masukan Username",
                  hintStyle: TextStyle(color: Colors.black87),
                  prefixIcon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                  labelText: "Username",
                  labelStyle: TextStyle(color: Colors.black87)),
              onChanged: (String? value) {
                setState(() {
                  _username = value!;
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Masukan Password",
                  hintStyle: TextStyle(color: Colors.black87),
                  prefixIcon: Icon(
                    Icons.key,
                    size: 30,
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black87)),
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
                    minimumSize: Size(100, 45)),
                child: Text(
                  'Login',
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.bold),
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
                      fontSize: 15, fontWeight: FontWeight.bold),
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
