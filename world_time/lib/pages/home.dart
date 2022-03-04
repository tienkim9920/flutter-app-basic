import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time/models/time.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final time = ModalRoute.of(context)!.settings.arguments as Time;

    String bgImage = time.isDayTime ? 'day.png' : 'night.png';
    Color colorImage = time.isDayTime ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('World Time'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(children: [
              ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(13, 71, 161, 1))),
                  onPressed: () => Navigator.pushNamed(context, '/location'),
                  icon: Icon(Icons.edit_location),
                  label: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Edit Location',
                          style: TextStyle(color: colorImage)))),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    time.location,
                    style: TextStyle(
                        fontSize: 28.0, letterSpacing: 2.0, color: colorImage),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(time.time,
                  style: TextStyle(fontSize: 50.0, color: colorImage)),
            ]),
          ),
        ),
      ),
    );
  }
}
