import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/page/wallofhope/wallofhope_menu.dart';
import 'package:c06_pas_pbp/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: camel_case_types
class wallofhopeLinkPage extends StatefulWidget {
  const wallofhopeLinkPage({super.key});

  final String title = 'Wall Of Hope';

  @override
  State<wallofhopeLinkPage> createState() => _wallofhopeLinkPage();
}

// ignore: camel_case_types
class _wallofhopeLinkPage extends State<wallofhopeLinkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petunjuk Pembuatan Wall of Hope'),
        backgroundColor: Color(0xff395144),
      ),
      drawer: const PTS_Drawer(),
      body: Column(
        children: [
         Container(
            child: WebView(
              initialUrl: "https://github.com/kkoep/C06-PTS-PBP/issues",
              javascriptMode: JavascriptMode.unrestricted,

              navigationDelegate: (NavigationRequest request){
                if (request.url.contains("https://github.com/kkoep/C06-PTS-PBP/issues")){
                  return NavigationDecision.navigate;
                }
                else{
                  return NavigationDecision.prevent;
                }
              },
              onPageStarted: (String url) {
                
              },
              onPageFinished: (String url){
                
              },

            )
         ),
          Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
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
            ],
          )),
        ])
      
    );
  }
}
