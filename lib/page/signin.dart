import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/page/login.dart';
import 'package:c06_pas_pbp/main.dart';
import 'package:c06_pas_pbp/drawer.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  final String title = "SignUp";
  @override
  _SignUpState createState() => _SignUpState();
}

class MySignUpPage extends StatelessWidget {
  const MySignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignUp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.black),
      home: SignUp(),
    );
  }
}

class _SignUpState extends State<SignUp> {
  final _regFormKey = GlobalKey<FormState>();
  String _chosenValue = "";
  String role = "Dokter";
  List<String> listRole = ['Dokter', 'Pasien'];
  String email = "";
  String username = "";
  String namaLengkap = "";
  String password1 = "";
  String password2 = "";
  bool isPasswordVisible = false;

  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        drawer: const PTS_Drawer(),
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color(0xffAA8B56),
        ),
        body: Form(
            key: _regFormKey,
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
                          hintText: "Masukan Email",
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.email,
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
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Email tidak boleh kosong!';
                        }
                        return null;
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
                          hintText: "Masukan Username",
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.person_pin_outlined,
                            size: 30,
                          ),
                          labelText: "Username",
                          labelStyle: TextStyle(color: Colors.black)),
                      onChanged: (String? value) {
                        setState(() {
                          username = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          username = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Username tidak boleh kosong!';
                        }
                        return null;
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
                          hintText: "Masukan Nama Lengkap",
                          hintStyle: TextStyle(color: Colors.black87),
                          prefixIcon: Icon(
                            Icons.person,
                            size: 30,
                          ),
                          labelText: "Nama Lengkap",
                          labelStyle: TextStyle(color: Colors.black87)),
                      onChanged: (String? value) {
                        setState(() {
                          namaLengkap = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          namaLengkap = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                    child: TextFormField(
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xfff0ebce),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "Masukan Password",
                          hintStyle: TextStyle(color: Colors.black87),
                          prefixIcon: Icon(
                            Icons.key_rounded,
                            size: 30,
                          ),
                          suffixIcon: ElevatedButton(
                              onPressed: togglePasswordView,
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
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
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Password tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                    child: TextFormField(
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xfff0ebce),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "Masukan ulang Password",
                          hintStyle: TextStyle(color: Colors.black87),
                          prefixIcon: Icon(
                            Icons.key_rounded,
                            size: 30,
                          ),
                          suffixIcon: ElevatedButton(
                              onPressed: togglePasswordView,
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  minimumSize: Size(30, 45)),
                              child: Icon(
                                Icons.remove_red_eye,
                                size: 30,
                              )),
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(color: Colors.black87)),
                      onChanged: (String? value) {
                        setState(() {
                          password2 = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          password2 = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Password tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xfff0ebce),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
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
                            minimumSize: Size(100, 45)),
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xfff0ebce)),
                        ),
                        onPressed: () async {
                          if (_regFormKey.currentState!.validate()) {
                            final response = await request.post(
                                "https://pts-c06-pbp.up.railway.app/auth/register/",
                                {
                                  'username': username,
                                  'password1': password1,
                                  'password2': password2,
                                  'email': email,
                                  'nama': namaLengkap,
                                  'role': role.toUpperCase(),
                                }).then((value) => {
                                  print(value),
                                  if (value['status'])
                                    {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Login()),
                                      ),
                                    }
                                  else
                                    {
                                      if (value['role_error'])
                                        {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                elevation: 15,
                                                child: Container(
                                                  child: ListView(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    shrinkWrap: true,
                                                    children: <Widget>[
                                                      SizedBox(height: 20),
                                                      Center(
                                                        child:
                                                            Column(children: [
                                                          Text(value["message"],
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      16)),
                                                        ]),
                                                      ),
                                                      SizedBox(height: 20),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          'ok',
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        }
                                      else if (value["message"]["username"] !=
                                          null)
                                        {
                                          print(
                                              value["message"]["username"][0]),
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                elevation: 15,
                                                child: Container(
                                                  child: ListView(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    shrinkWrap: true,
                                                    children: <Widget>[
                                                      SizedBox(height: 20),
                                                      Center(
                                                        child:
                                                            Column(children: [
                                                          Text(
                                                              value["message"][
                                                                      "username"]
                                                                  [0],
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      16)),
                                                        ]),
                                                      ),
                                                      SizedBox(height: 20),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          'ok',
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        }
                                      else if (value["message"]["password2"] !=
                                          null)
                                        {
                                          print(
                                              value["message"]["password2"][0]),
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                elevation: 15,
                                                child: Container(
                                                  child: ListView(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    shrinkWrap: true,
                                                    children: <Widget>[
                                                      SizedBox(height: 20),
                                                      Center(
                                                        child:
                                                            Column(children: [
                                                          Text(
                                                              value["message"][
                                                                      "password2"]
                                                                  [0],
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      16)),
                                                        ]),
                                                      ),
                                                      SizedBox(height: 20),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          'ok',
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        }
                                    }
                                });
                          }
                        },
                      )),
                ],
              ),
            )));
  }
}
