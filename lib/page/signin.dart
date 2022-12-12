import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/page/login.dart';

void main() {
  runApp(MySigninPage());
}

class MySigninPage extends StatelessWidget {
  const MySigninPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signin',
      debugShowCheckedModeBanner: false,
      home: Signin(),
    );
  }
}

class Signin extends StatefulWidget {
  const Signin({super.key});
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String _chosenValue = "";
  String role = "Dokter";
  List<String> listRole = ['Dokter', 'Pasien'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
          SizedBox(
            height: 20,
          ),
          Text("Buat Akun",
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
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(
                  Icons.email,
                  size: 30,
                ),
              ),
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
                hintText: "Username",
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(
                  Icons.person_pin_outlined,
                  size: 30,
                ),
              ),
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
                hintText: "Nama Lengkap",
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(
                  Icons.person,
                  size: 30,
                ),
              ),
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
                  Icons.key_rounded,
                  size: 30,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xfff0ebce),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  )),
              //dropdownColor: Colors.white,
              value: role,
              items: listRole.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  role = newValue!;
                });
              },
            ),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(40, 15, 40, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(100, 45),
                    backgroundColor: Color(0xffAA8B56)),
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
                    MaterialPageRoute(builder: (context) => MyLoginPage()),
                  );
                },
              )),
        ],
      ),
    ));
    throw UnimplementedError();
  }
}
