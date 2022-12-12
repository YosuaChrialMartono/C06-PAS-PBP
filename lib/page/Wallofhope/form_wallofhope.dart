import 'package:c06_pas_pbp/page/wallofhope/wallofhope_menu.dart';
import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/drawer.dart';

class formWallofhopePage extends StatefulWidget {
  const formWallofhopePage({super.key});

  final String title = 'Wall Of Hope';

  @override
  State<formWallofhopePage> createState() => _formWallofhopePage();
}

class _formWallofhopePage extends State<formWallofhopePage> {
  final _formKey = GlobalKey<FormState>();
  String judul = "";
  String deskripsi = "";
  String link = "";

  @override
  Widget build(BuildContext context) {
    final request = null; //context<Wallofhope>;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color(0xff395144),
        ),
        drawer: const PTS_Drawer(),
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xff4E6C50), Color(0xffaa8b56)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )),
            child: Form(
              key: _formKey,
              child: Column(children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Judul",
                      hintStyle: const TextStyle(color: Colors.white),
                      labelText: "Judul",
                      labelStyle: const TextStyle(color: Colors.white),
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(
                        Icons.title,
                        color: Colors.white,
                      ),
                      // Menambahkan circular border agar lebih rapi
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          )),
                      border: const OutlineInputBorder(),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul wall of hope tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Link Image",
                      hintStyle: const TextStyle(color: Colors.white),
                      labelText: "Link Image",
                      labelStyle: const TextStyle(color: Colors.white),
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(
                        Icons.image_rounded,
                        color: Colors.white,
                      ),
                      // Menambahkan circular border agar lebih rapi
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          )),
                      border: const OutlineInputBorder(),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        link = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        link = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Link image tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Deskripsi",
                      hintStyle: const TextStyle(color: Colors.white),
                      labelText: "Deskripsi",
                      labelStyle: const TextStyle(color: Colors.white),
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(
                        Icons.pages,
                        color: Colors.white,
                      ),
                      // Menambahkan circular border agar lebih rapi
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          )),
                      border: const OutlineInputBorder(),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        deskripsi = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        deskripsi = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
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
                                            padding: const EdgeInsets.only(
                                                top: 20, bottom: 20),
                                            shrinkWrap: true,
                                            children: <Widget>[
                                              const Center(
                                                  child: Text(
                                                      'Berhasil Menambahkan Data')),
                                              const SizedBox(height: 20),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Kembali'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                  const url =
                                      "https://pts-c06-pbp.up.railway.app/wallofhope/add/";
                                  final response = await request.post(url, {
                                    "judul": judul,
                                    "link": link,
                                    "deskripsi": deskripsi,
                                  });
                                } else {
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
                                            padding: const EdgeInsets.only(
                                                top: 20, bottom: 20),
                                            shrinkWrap: true,
                                            children: <Widget>[
                                              const Center(
                                                  child: Text(
                                                      'Terdapat kesalahan, Silahkan coba lagi!')),
                                              const SizedBox(height: 20),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Kembali'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              child: const Text(
                                "Simpan",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const wallofhopeMenuPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Kembali",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    )),
              ]),
            )));
  }
}
