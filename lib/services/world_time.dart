import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //Location name for the UI
  String time; //The time in that location
  String url; //The location url for the API endpoint
  bool isDayTime; //True = daytime, False = nighttime

  WorldTime({this.location, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);

      String dateTime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));


      if (now.hour > 6 && now.hour < 20) {
        isDayTime = true;
      } else {
        isDayTime = false;
      }

      time = DateFormat.jm()
          .format(now); //Formatting the date to something that looks better
    } catch (e) {

      time =
          "Could not get time!";
    }
  }
}

// How to use this class
// WorldTime instance = WorldTime(location: "Berlin", flag: "germany.png", url: "/Europe/Berlin");
// instance.getTime();
