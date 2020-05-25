import 'package:flutter/material.dart';
import "package:world_time_app/pages/loading.dart";

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  final myControllerContinent = TextEditingController();
  final myControllerCity = TextEditingController();

  String city;
  String continent;

  void dispose() {
    myControllerContinent.dispose();
    myControllerCity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Enter the location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            "Please enter the continent",
            style: TextStyle(
              fontSize: 28.0,
              decoration: TextDecoration.underline,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0),
            child: TextField(
              controller: myControllerContinent,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Please enter the city",
            style: TextStyle(
              fontSize: 28.0,
              decoration: TextDecoration.underline,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0),
            child: TextField(
              controller: myControllerCity,
            ),
          ),
          FloatingActionButton(onPressed: () async {
            Loading.city = myControllerCity.text;
            Loading.continent = myControllerContinent.text;
            Navigator.pushNamed(context, "/");
          }),
        ],
      ),
    );
  }
}
