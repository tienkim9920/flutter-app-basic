import 'package:flutter/material.dart';
import 'package:world_time/models/time.dart';
import 'package:world_time/service/world_time.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late Map<dynamic, dynamic> data = {};

  // void getUpdateWorldTime() async {
  //   print("16");
  //   ServiceWorldTime result =
  //       await Navigator.pushNamed(context, '/location') as ServiceWorldTime;
  //   print("19");
  //   setState(() => {
  //         data = {
  //           'location': result.location,
  //           'time': result.time,
  //           'flag': result.flag,
  //           'isDaytime': result.isDaytime
  //         }
  //       });
  // }

  void gotoBook() {
    Navigator.pushNamed(context, '/checklist');
  }

  void gotoWorkline() {
    Navigator.pushNamed(context, '/workline');
  }

  @override
  Widget build(BuildContext context) {
    // data = data.isNotEmpty
    //     ? data
    //     : ModalRoute.of(context)!.settings.arguments as Map;

    // String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    // Color colorImage = data['isDaytime'] ? Colors.white : Colors.black;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/day.png'), fit: BoxFit.cover)),
          child: Container(
            margin: const EdgeInsets.only(top: 150),
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Text(
                'Nguyễn Quốc Toàn',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(height: 60),
              // ElevatedButton.icon(
              //     style: ButtonStyle(
              //         backgroundColor: MaterialStateProperty.all<Color>(
              //             Color.fromRGBO(48, 135, 189, 1))),
              //     onPressed: () => getUpdateWorldTime(),
              //     icon: Icon(Icons.edit_location),
              //     label: Padding(
              //         padding: EdgeInsets.all(10.0),
              //         child: Text('Chọn Địa Điểm',
              //             style: TextStyle(color: colorImage)))),
              // SizedBox(height: 20.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Text(
              //       data['location'],
              //       style: TextStyle(
              //           fontSize: 28.0, letterSpacing: 2.0, color: colorImage),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 20.0),
              // Text(data['time'],
              //     style: TextStyle(fontSize: 50.0, color: colorImage)),
              SizedBox(height: 40.0),
              ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(48, 135, 189, 1))),
                  onPressed: () => gotoBook(),
                  icon: Icon(Icons.view_list),
                  label: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Danh Sách Xe Moto',
                          style: TextStyle(color: Colors.white)))),
              // SizedBox(height: 20.0),
              // ElevatedButton.icon(
              //     style: ButtonStyle(
              //         backgroundColor: MaterialStateProperty.all<Color>(
              //             Color.fromRGBO(48, 135, 189, 1))),
              //     onPressed: () => gotoWorkline(),
              //     icon: Icon(Icons.checklist),
              //     label: Padding(
              //         padding: EdgeInsets.all(10.0),
              //         child: Text('Lên Lịch Trình',
              //             style: TextStyle(color: Colors.white)))),
            ]),
          ),
        ),
      ),
    );
  }
}
