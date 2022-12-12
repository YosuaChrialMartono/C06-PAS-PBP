import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:c06_pas_pbp/drawer.dart';
import 'package:c06_pas_pbp/model/tracker.dart';

class TrackerData extends StatefulWidget {
  const TrackerData({super.key});

  static const String title = 'Tracker';

  @override
  State<TrackerData> createState() => _TrackerDataState();
}

class _TrackerDataState extends State<TrackerData> {
  Future<List<Tracker>> fetchTrackers() async {
    var trackers = await Tracker.fetchMyTracker();

    return trackers;
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
          child: SingleChildScrollView(
            child: FutureBuilder<List<Tracker>>(
              future: fetchTrackers(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // Create a list of DataRow widgets
                  var rows = snapshot.data?.map((tracker) => DataRow(
                    cells: [
                      DataCell(Text(tracker.pk.toString())),
                      DataCell(Text(tracker.fields.email)),
                      DataCell(Text(tracker.fields.age.toString())),
                      DataCell(Text(tracker.fields.gender)),
                      DataCell(Text(tracker.fields.headCircumference.toString())),
                      DataCell(Text(tracker.fields.height.toString())),
                      DataCell(Text(tracker.fields.weight.toString())),
                      DataCell(Text(tracker.fields.description)),
                    ],
                  ));

                  return DataTable(
                    columns: [
                      DataColumn(label: Text('No')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Age')),
                      DataColumn(label: Text('Gender')),
                      DataColumn(label: Text('Head\nCircumference')),
                      DataColumn(label: Text('Height')),
                      DataColumn(label: Text('Weight')),
                      DataColumn(label: Text('Description')),
                    ],
                    rows: rows!.toList(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Failed to load data: ${snapshot.error}');
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }

}
