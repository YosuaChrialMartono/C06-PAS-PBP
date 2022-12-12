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
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.black),
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
      color: Colors.white,
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
                  color: Colors.black)),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Masukan Email",
                  hintStyle: TextStyle(color: Colors.black87),
                  prefixIcon: Icon(
                    Icons.email,
                    size: 30,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black87)),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Masukan Username",
                  hintStyle: TextStyle(color: Colors.black87),
                  prefixIcon: Icon(
                    Icons.person_pin_outlined,
                    size: 30,
                  ),
                  labelText: "Username",
                  labelStyle: TextStyle(color: Colors.black87)),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Masukan Nama Lengkap",
                  hintStyle: TextStyle(color: Colors.black87),
                  prefixIcon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                  labelText: "Nama Lengkap",
                  labelStyle: TextStyle(color: Colors.black87)),
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
                    Icons.key_rounded,
                    size: 30,
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black87)),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              )),
              dropdownColor: Colors.white,
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
                    minimumSize: Size(100, 45)),
                child: Text(
                  'Signin',
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.bold),
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
