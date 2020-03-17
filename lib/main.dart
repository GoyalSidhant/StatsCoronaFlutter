import 'package:CoronaTracker/india.dart';
import 'package:flutter/material.dart';
import 'package:CoronaTracker/about.dart';
import 'package:CoronaTracker/advices.dart';
import 'package:CoronaTracker/google_map_base.dart';
import 'package:CoronaTracker/stats.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Virus Tracker',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.dark

      ),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Corona Virus Tracker'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "Stats",
                ),
                Tab(
                  text: "India",
                  ),
                Tab(
                  text: "Maps",
                ),
                Tab(
                  text: "Advices",
                ),
                Tab(
                  text: "About",
                ),
              ],
            ),
            
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              StatsPage(),
              India(),
              BaseGoogleMap().getWidget(),
              AdvicesPage(),
              AboutPage(),

            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
