import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    String background;
    Color textColor;
    Color scaffoldColor;

    if (data["isDayTime"] == true) {
      background = "assets/day.jpeg";
      textColor = Colors.black;
      scaffoldColor = Colors.blueAccent;
    } else {
      background = "assets/night.jpeg";
      textColor = Colors.white;
      scaffoldColor = Colors.black87;
    }

    return Scaffold(
      backgroundColor: scaffoldColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(background),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/location");
                },
                icon: Icon(Icons.edit_location),
                label: Text(
                  "Edit Location",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                textColor: textColor,
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data["location"],
                    style: TextStyle(
                      color: textColor,
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data["time"],
                style: TextStyle(
                  color: textColor,
                  fontSize: 66.0,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
