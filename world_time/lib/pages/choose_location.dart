import 'package:flutter/material.dart';
import 'package:world_time/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<ServiceWorldTime> serviceWorld = [
    ServiceWorldTime('New York', 'newyork.png', 'America/New_York'),
    ServiceWorldTime('Maceio', 'mecio.png', 'America/Maceio'),
    ServiceWorldTime('Hồ Chí Minh', 'vietnam.png', 'Asia/Ho_Chi_Minh'),
    ServiceWorldTime('Seoul', 'seoul.png', 'Asia/Seoul'),
    ServiceWorldTime('Singapore', 'singapore.png', 'Asia/Singapore'),
    ServiceWorldTime('Japan', 'tokyo.png', 'Asia/Tokyo'),
    ServiceWorldTime('Chicago', 'chicago.png', 'America/Chicago'),
    ServiceWorldTime('Costa Rica', 'costa_rica.png', 'America/Costa_Rica'),
    ServiceWorldTime('Vladivostok', 'vladivostok.png', 'Asia/Vladivostok'),
  ];

  void getUpdateTime(index) async {
    ServiceWorldTime worldChoose = serviceWorld[index];
    await worldChoose.getTime();

    Navigator.pop(context, worldChoose);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        child: ListView.builder(
          itemCount: serviceWorld.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () => getUpdateTime(index),
                title: Text(serviceWorld[index].location),
                leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${serviceWorld[index].flag}')),
              ),
            );
          },
        ),
      ),
    );
  }
}
