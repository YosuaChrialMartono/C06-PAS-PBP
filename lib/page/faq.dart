import 'package:c06_pas_pbp/page/faqdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/model/faq_rec.dart';
import 'package:c06_pas_pbp/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQstate();
}

class _FAQstate extends State<FAQ> {
  Future<List<FaqRecommendations>> fetchFAQRec() async {
    var url = Uri.parse('https://pts-c06-pbp.up.railway.app/faq/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<FaqRecommendations> listFAQRec = [];
    for (var d in data) {
      if (d != null) {
        listFAQRec.add(FaqRecommendations.fromJson(d));
      }
    }
    return listFAQRec;
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(FaqRecommendations faqRec) => ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            child: const Icon(Icons.autorenew, color: Colors.white),
          ),
          title: Text(
            faqRec.fields.title,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        FAQDetailPage(faqRecommendations: faqRec)));
          },
        );

    Card makeCard(FaqRecommendations faqRec) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Container(
            child: makeListTile(faqRec),
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Frequently Asked Questions"),
        centerTitle: true,
      ),
      drawer: const PTS_Drawer(),
      body: FutureBuilder(
          future: fetchFAQRec(),
          builder: (context, AsyncSnapshot snapshot) {
            print(snapshot);
            print("biar beda");
            if (snapshot.hasData == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada FAQ",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => makeCard(snapshot.data![index]));
              }
            }
          }),
    );
  }
}
