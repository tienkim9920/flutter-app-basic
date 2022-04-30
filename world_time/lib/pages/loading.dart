import 'package:flutter/material.dart';
import 'package:world_time/service/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),
      () => gotoScreenHome());

    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(48, 135, 189, 1),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset('assets/checklist.png', width: 150, height: 100),
                  Text(
                    'Sổ Tay',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white
                    ),
                  )
                ],
              )
            ],
          )
        ]));
  }
}
