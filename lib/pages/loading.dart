import 'package:flutter/material.dart';
import "package:world_time_app/services/world_time.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class Loading extends StatefulWidget {
  static String city;
  static String continent;

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    String city = Loading.city;
    String continent = Loading.continent;

    if (city == null && continent == null) {
      city = "Berlin";
      continent = "Europe";
    }
    WorldTime instance = WorldTime(location: city, url: "/$continent/$city");
    print("/$continent/$city");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "time": instance.time,
      "isDayTime": instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 55.0,
        ),
      ),
    );
  }
}
