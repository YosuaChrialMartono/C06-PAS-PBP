import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/page/signin.dart';
import 'package:c06_pas_pbp/main.dart';
import 'package:c06_pas_pbp/drawer.dart';
import 'package:c06_pas_pbp/page/landingpage.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  final String title = "Login";
  @override
  LoginState createState() => LoginState();
}

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  static String email = "";
  static String password1 = "";

  static String userName = "";
  static String userRole = "";
  static bool loggedIn = false;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color(0xffAA8B56),
        ),
        drawer: const PTS_Drawer(),
        body: Form(
            key: _formKey,
            child: Container(
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
                          hintText: "Masukan email",
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.person,
                            size: 30,
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.black)),
                      onChanged: (String? value) {
                        setState(() {
                          email = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          email = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'email tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                      child: Stack(
                        children: [
                          TextFormField(
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xfff0ebce),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: "Masukan Password",
                                hintStyle: TextStyle(color: Colors.black),
                                prefixIcon: Icon(
                                  Icons.key,
                                  size: 30,
                                ),
                                suffixIcon: ElevatedButton(
                                    onPressed: togglePasswordView,
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        minimumSize: Size(30, 45)),
                                    child: Icon(
                                      Icons.remove_red_eye,
                                      size: 30,
                                    )),
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.black87)),
                            onChanged: (String? value) {
                              setState(() {
                                password1 = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                password1 = value!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Password tidak boleh kosong!';
                              }
                              return null;
                            },
                          ),
                        ],
                      )),
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final response = await request.login(
                                "https://pts-c06-pbp.up.railway.app/auth/login/",
                                {
                                  'email': email,
                                  'password': password1,
                                });
                            if (request.loggedIn) {
                              // Code here will run if the login succeeded.
                              _formKey.currentState!.reset();
                              setState(() {
                                loggedIn = request.loggedIn;
                                userName = response["username"];
                                userRole = response["role"];
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyLandingPage()));
                            } else {
                              // Code here will run if the login failed (wrong email/password).
                            }
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 15,
                                  child: Container(
                                    child: ListView(
                                      padding: const EdgeInsets.all(20),
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        SizedBox(height: 20),
                                        Center(
                                          child: Column(children: [
                                            Text(response["message"],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 16)),
                                          ]),
                                        ),
                                        SizedBox(height: 20),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'ok',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      )),
                  Row(
                    children: <Widget>[
                      Text('Belum mempunyai akun?',
                          style: GoogleFonts.montserrat(fontSize: 15)),
                      TextButton(
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff395144)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MySignUpPage()),
                          );
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            )));
  }
}
