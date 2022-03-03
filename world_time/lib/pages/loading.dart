import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
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
              onPressed: () => {Navigator.pushNamed(context, '/home')},
              icon: Icon(Icons.edit_location),
              label: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Redirect Home"),
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
              onPressed: () => {Navigator.pushNamed(context, '/book')},
              icon: Icon(Icons.edit_location),
              label: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Redirect Book"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
