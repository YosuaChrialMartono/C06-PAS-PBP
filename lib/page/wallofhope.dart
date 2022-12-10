import 'package:c06_pas_pbp/drawer.dart';
import 'package:c06_pas_pbp/page/wallofhope.dart';
import 'package:c06_pas_pbp/page/form_wallofhope.dart';
import 'package:c06_pas_pbp/page/wallofhope_menu.dart';
import 'package:flutter/material.dart';

class wallofhopePage extends StatefulWidget {
  const wallofhopePage({super.key});

  @override
  wallofhopePageState createState() => wallofhopePageState();
}

class wallofhopePageState extends State<wallofhopePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Wall of Hope'),
        ),
        drawer: const PTS_Drawer(),
        body: Column(children: [
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.arrow_drop_down_circle),
                        title: const Text('Card title 1'),
                        subtitle: Text(
                          'Secondary Text',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                            onPressed: () {
                              // Perform some action
                            },
                            child: const Text(
                              'ACTION 1',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                            onPressed: () {
                              // Perform some action
                            },
                            child: const Text(
                              'ACTION 2',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
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
                backgroundColor: MaterialStateProperty.all(Colors.blue),
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
          )
        ]));
  }
}
