import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/drawer.dart';


class wallofhopePage extends StatefulWidget {
    const wallofhopePage({super.key});

    final String title = 'Wall Of Hope';

    @override
    State<wallofhopePage> createState() => _wallofhopePage();
}

class _wallofhopePage extends State<wallofhopePage> {
  final _formKey = GlobalKey<FormState>();
  String judul = "";
  int  nominal = 0;
  List<String> macamTipeBudget = ["pemasukan", "pengeluaran"];
  String tipe_budget = "pemasukan";



    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
            ),
        drawer: const PTS_Drawer(),
        body: Form( 
          key: _formKey,
          child: SingleChildScrollView( 
            child: Container( 
              padding: const EdgeInsets.all(20.0),
              child: Column(
              children: [
              Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Judul",
                            labelText: "Judul",
                            // Menambahkan icon agar lebih intuitif
                            icon: const Icon(Icons.people),
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
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
                                return 'Nama lengkap tidak boleh kosong!';
                            }
                            return null;
                        },
                    ),
                ),
              Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Nominal",
                            labelText: "Nominal",
                            // Menambahkan icon agar lebih intuitif
                            icon: const Icon(Icons.people),
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        // Menambahkan behavior saat nama diketik 
                        onChanged: (String? value) {
                            setState(() {
                                nominal = int.parse(value!);
                            });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                            setState(() {
                                nominal = int.parse(value!);
                            });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Nominal tidak boleh kosong!';
                            }
                            return null;
                        },
                    ),
                ),
              ListTile(
            leading: const Icon(Icons.class_),
            title: const Text(
                'Jenis Pembayaran',
            ),
            trailing: DropdownButton(
                value: tipe_budget,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: macamTipeBudget.map((String items) {
                return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                );
                }).toList(),
                onChanged: (String? newValue) {
                setState(() {
                    tipe_budget = newValue!;
                });
                },
            ),
            ),
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
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
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
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
                  }
                },
                child: const Text(
                  "Simpan",
                  style: TextStyle(color: Colors.white),
                )
            )
            ])
            )
          )
        )
        );
    }
}