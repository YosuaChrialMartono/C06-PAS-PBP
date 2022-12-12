import 'package:c06_pas_pbp/main.dart';
import 'package:c06_pas_pbp/model/comment.dart';
import 'package:c06_pas_pbp/page/forum/forumForm.dart';
import 'package:c06_pas_pbp/page/forum/forumDetail.dart';
import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:c06_pas_pbp/page/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forum Diskusi',
      theme: ThemeData(
        textTheme: const TextTheme(headline4: TextStyle(color: Colors.red)),
        primarySwatch: Colors.blue,
      ),
      home: const MyForumPage(),
    );
  }
}

class MyForumPage extends StatefulWidget {
  const MyForumPage({super.key});

  final String title = 'Forum Diskusi';

  @override
  State<MyForumPage> createState() => _ForumPage();
}

class _ForumPage extends State<MyForumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: const Color(0xffAA8B56),
          centerTitle: true,
        ),
        drawer: const PTS_Drawer(),
        endDrawer: Column(
          children: [
            if (LoginState.loggedIn == true)
              Container(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: const Size(100, 45),
                        backgroundColor: const Color(0xffAA8B56)),
                    child: Text(
                      'Post',
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xfff0ebce)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForumForm()),
                      );
                    },
                  )),
          ],
        ),
        body: FutureBuilder(
            future: Comment.fetchComments(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8),
                    color: const Color(0xfff0ebce),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Forum kosong",
                            style: GoogleFonts.montserrat(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Container(
                            padding: const EdgeInsets.fromLTRB(40, 15, 40, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  minimumSize: const Size(100, 45)),
                              child: Text(
                                'Kembali',
                                style: GoogleFonts.montserrat(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyHomePage()),
                                );
                              },
                            )),
                        Container(
                            padding: const EdgeInsets.fromLTRB(40, 15, 40, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  minimumSize: const Size(100, 45)),
                              child: Text(
                                'Buat Postingan',
                                style: GoogleFonts.montserrat(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyHomePage()),
                                );
                              },
                            )),
                      ],
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForumDetailPage(
                                      modelForum: snapshot.data![index])),
                            ),
                            child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Row(
                                  children: [
                                    Center(
                                      child: Text(
                                        "${snapshot.data![index].title}",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ));
                }
              }
            }));
    // Center is a layout widget. It takes a single child and positions it
    // in the middle of the parent.
  }
}
