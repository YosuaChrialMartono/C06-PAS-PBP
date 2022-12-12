import 'package:c06_pas_pbp/drawer.dart';
import 'package:c06_pas_pbp/page/Wallofhope/form_wallofhope.dart';
import 'package:c06_pas_pbp/page/wallofhope/wallofhope_menu.dart';
import 'package:c06_pas_pbp/utils/Fetch_Wallofhope.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:c06_pas_pbp/page/login.dart';

class wallofhopePage extends StatefulWidget {
  const wallofhopePage({super.key});

  @override
  wallofhopePageState createState() => wallofhopePageState();
}

class wallofhopePageState extends State<wallofhopePage> {
  @override
  Widget build(BuildContext context) {
    final request = null; //context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Wall Of Hope"),
        backgroundColor: Color(0xffAA8B56),
      ),
      drawer: const PTS_Drawer(),
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff4E6C50), Color(0xffaa8b56)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
          child: Column(children: [
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                    future: fetchwallofhope(request),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        if (LoginState.loggedIn == true) {
                          if (LoginState.userRole == "Pasien") {
                            return Column(
                              children: [
                                addSection(),
                                const Center(
                                    child: CircularProgressIndicator()),
                                const Text(
                                  "wall of hope berisi null",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            );
                          }
                        }
                        return Column(
                          children: const [
                            Center(child: CircularProgressIndicator()),
                            Text(
                              "wall of hope berisi null",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        );
                      } else {
                        if (snapshot.data <= 0) {
                          if (LoginState.loggedIn == true) {
                            if (LoginState.userRole == "Pasien") {
                              return Column(
                                children: [
                                  addSection(),
                                  const Text(
                                    "Wall of hope kosong!, silahkan isi untuk menampilkan wall of hope",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              );
                            }
                          }
                          return Column(
                            children: const [
                              Text(
                                "Wall of hope kosong!, silahkan isi untuk menampilkan wall of hope",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              SizedBox(height: 8),
                            ],
                          );
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) {
                                return Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: const Icon(
                                              Icons.arrow_drop_down_circle),
                                          title: Text(
                                              "${snapshot.data![index].fields.judul}"),
                                          subtitle: Text(
                                            '=========',
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.6)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            "${snapshot.data![index].fields.deskripsi}",
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.6)),
                                          ),
                                        ),
                                        ButtonBar(
                                          alignment: MainAxisAlignment.start,
                                          children: [
                                            TextButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.blue),
                                              ),
                                              onPressed: () {
                                                // Perform some action
                                              },
                                              child: const Text(
                                                'ACTION 1',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            TextButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.blue),
                                              ),
                                              onPressed: () {
                                                // Perform some action
                                              },
                                              child: const Text(
                                                'ACTION 2',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ));
                              });
                        }
                      }
                    }),
              ],
            )

                // FutureBuilder(
                //     future: fetchWatchlist(),
                //     builder: (context, AsyncSnapshot snapshot) {
                //       if (snapshot.data == null) {
                //         return const Center(child: CircularProgressIndicator());
                //       } else {
                //         if (!snapshot.hasData) {
                //           return Column(
                //             children: const [
                //               Text(
                //                 "Tidak ada Watch List :(",
                //                 style:
                //                     TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                //               ),
                //               SizedBox(height: 8),
                //             ],
                //           );
                //         } else {
                //           return ListView.builder(
                //               itemCount: snapshot.data!.length,
                //               itemBuilder: (_, index) => GestureDetector(
                //                     onTap: () {
                //                       Navigator.pushReplacement(
                //                         context,
                //                         MaterialPageRoute(
                //                             builder: (context) => wallofhopePage(
                //                                 myWatchList: snapshot.data![index])),
                //                       );
                //                     },
                //                     child: Container(
                //                       margin: const EdgeInsets.symmetric(
                //                           horizontal: 8, vertical: 6),
                //                       padding: const EdgeInsets.all(10.0),
                //                       decoration: BoxDecoration(
                //                           border: Border.all(
                //                               width: 1.0,
                //                               color: ((snapshot
                //                                       .data![index].fields.watched)
                //                                   ? Colors.green
                //                                   : Colors.red)),
                //                           color: Colors.white,
                //                           borderRadius: BorderRadius.circular(10.0),
                //                           boxShadow: const [
                //                             BoxShadow(
                //                                 color: Colors.grey, blurRadius: 0.5)
                //                           ]),
                //                       child: Row(
                //                         children: [
                //                           Expanded(
                //                             child: Text(
                //                               "${snapshot.data![index].fields.title}",
                //                               style: const TextStyle(
                //                                 fontSize: 17.0,
                //                                 fontWeight: FontWeight.bold,
                //                               ),
                //                             ),
                //                           ),
                //                           SizedBox(
                //                             width: 30,
                //                             child: CheckboxListTile(
                //                                 value: snapshot
                //                                     .data![index].fields.watched,
                //                                 onChanged: (bool? value) {
                //                                   setState(() {
                //                                     snapshot.data![index].fields
                //                                             .watched =
                //                                         !snapshot.data![index].fields
                //                                             .watched;
                //                                   });
                //                                 }),
                //                           )
                //                         ],
                //                       ),
                //                     ),
                //                   ));
                //         }
                //       }
                //     })

                ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const wallofhopeMenuPage(),
                    ),
                  );
                },
                child: const Text(
                  'Kembali',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ])),
    );
  }

  Widget addSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 18),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 110,
          height: 40,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const formWallofhopePage()),
              );
            },
            child: const Text(
              "Isi Form",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
