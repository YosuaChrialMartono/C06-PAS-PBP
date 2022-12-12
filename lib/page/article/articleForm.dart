import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/page/login.dart';
import 'package:c06_pas_pbp/main.dart';
import 'package:c06_pas_pbp/drawer.dart';

class ArticleForm extends StatefulWidget {
  const ArticleForm({super.key});
  final String title = "Form Artikel";
  @override
  _ArticleFormState createState() => _ArticleFormState();
}

class MyArticleFormPage extends StatelessWidget {
  const MyArticleFormPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Article Form',
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.black),
      home: ArticleForm(),
    );
  }
}

class _ArticleFormState extends State<ArticleForm> {
  final _regFormKey = GlobalKey<FormState>();
  String title = "";
  String content = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        drawer: const PTS_Drawer(),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Form(
            key: _regFormKey,
            child: Container(
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
                  Text("Buat artikel",
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
                          hintText: "Masukkan Title",
                          hintStyle: TextStyle(color: Colors.black87),
                          prefixIcon: Icon(
                            Icons.title,
                            size: 30,
                          ),
                          labelText: "Title",
                          labelStyle: TextStyle(color: Colors.black87)),
                      onChanged: (String? value) {
                        setState(() {
                          title = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          title = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Title tidak boleh kosong!';
                        }
                        return null;
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
                          hintText: "Masukan Isi Artikel",
                          hintStyle: TextStyle(color: Colors.black87),
                          prefixIcon: Icon(
                            Icons.text_fields,
                            size: 30,
                          ),
                          labelText: "Content",
                          labelStyle: TextStyle(color: Colors.black87)),
                      onChanged: (String? value) {
                        setState(() {
                          content = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          content = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Content tidak boleh kosong!';
                        }
                        return null;
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
                          'Post Artikel',
                          style: GoogleFonts.montserrat(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          if (_regFormKey.currentState!.validate()) {
                            final response = await request.post(
                                "https://pts-c06-pbp.up.railway.app/auth/register/",
                                //"http://127.0.0.1:8000/auth/register/",
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
