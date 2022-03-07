import 'package:flutter/material.dart';
import 'package:world_time/models/time.dart';
import 'package:world_time/service/world_time.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map data = {};

  void getUpdateWorldTime() async {
    ServiceWorldTime result =
        await Navigator.pushNamed(context, '/location') as ServiceWorldTime;
    setState(() => {
          data = {
            'location': result.location,
            'time': result.time,
            'flag': result.flag,
            'isDaytime': result.isDaytime
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color colorImage = data['isDaytime'] ? Colors.white : Colors.black;

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
          child: Container(
            margin: const EdgeInsets.only(top: 200),
            child: Column(children: [
              ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(13, 71, 161, 1))),
                  onPressed: () => getUpdateWorldTime(),
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
                    data['location'],
                    style: TextStyle(
                        fontSize: 28.0, letterSpacing: 2.0, color: colorImage),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(data['time'],
                  style: TextStyle(fontSize: 50.0, color: colorImage)),
            ]),
          ),
        ),
      ),
    );
  }
}
