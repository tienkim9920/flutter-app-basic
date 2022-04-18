import 'package:flutter/material.dart';
import 'package:world_time/service/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void gotoScreenBook() {
    Navigator.pushNamed(context, '/book');
  }

  void gotoScreenHome() async {
    ServiceWorldTime serviceWorldTime =
        ServiceWorldTime('Ho Chi Minh', 'germany.png', 'Asia/Ho_Chi_Minh');

    await serviceWorldTime.getTime();

    Navigator.pushNamed(context, '/home', arguments: {
      'location': serviceWorldTime.location,
      'time': serviceWorldTime.time,
      'flag': serviceWorldTime.flag,
      'isDaytime': serviceWorldTime.isDaytime
    });
  }

  void gotoTimeLine() {
    Navigator.pushNamed(context, '/timeline');
  }

  void gotoWorkLine() {
    Navigator.pushNamed(context, '/workline');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton.icon(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () => gotoScreenHome(),
              icon: Icon(Icons.edit_location),
              label: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("World Time"),
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () => gotoScreenBook(),
              icon: Icon(Icons.edit_location),
              label: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Manager Book"),
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () => gotoTimeLine(),
              icon: Icon(Icons.edit_location),
              label: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Manager Time Line"),
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () => gotoWorkLine(),
              icon: Icon(Icons.edit_location),
              label: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Manager Work Line"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
