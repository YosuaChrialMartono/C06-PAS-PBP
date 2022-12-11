import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:c06_pas_pbp/drawer.dart';


class TrackerData extends StatefulWidget {
  const TrackerData({super.key});

  static const String title = 'Tracker';

  @override
  State<TrackerData> createState() => _TrackerDataState();
}

class _TrackerDataState extends State<TrackerData> {
  late Future<List<dynamic>> _jsonData;

  @override
  void initState() {
    super.initState();
    _jsonData = getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Data from Tracker'),
        ),
        drawer: const PTS_Drawer(),
        body: Center(
          child: FutureBuilder(
            future: _jsonData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // Use the data here
                return Text('Data: ${snapshot.data}');
              } else if (snapshot.hasError) {
                return Text('Failed to load data: ${snapshot.error}');
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

Future<List<dynamic>> getJsonData() async {
  final response = await http.get(Uri.parse('https://pts-c06-pbp.up.railway.app/tracking/json/'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

