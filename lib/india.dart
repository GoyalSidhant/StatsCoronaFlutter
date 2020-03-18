import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './models/indiaStats.dart';

class India extends StatefulWidget {
  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  @override

  void initState() {
    super.initState();
  }

  Future<List<Regional>> getData() async {
    List<Regional> list;
    String link = "https://api.rootnet.in/covid19-in/stats/latest";
    
    var res = await http.get(link);
     //print(res.body);
      var data = json.decode(res.body);
      print(data);
      var rest = data["data"] as List;
      print(rest);
      list = rest.map<Regional>((json) => Regional.fromJson(json)).toList();
    print("List Size: ${list.length}");
    return list;
  }

Widget listViewWidget(List<Regional> regional) {
    return Container(
      child: ListView.builder(
          itemCount: 20,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, position) {
            return Card(
              child: Container(
                height: 120.0,
                width: 120.0,
                child: Center(
                  child: ListTile(
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        '${regional[position].loc}',
                      ),
                    ),
                    title: Text(
                      '${regional[position].confirmedCasesIndian}',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? listViewWidget(snapshot.data)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}

  