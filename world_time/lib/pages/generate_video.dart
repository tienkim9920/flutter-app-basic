import 'dart:async';

import 'package:flutter/material.dart';
import 'package:world_time/models/data_animals.dart';

class GenerateVideo extends StatefulWidget {
  const GenerateVideo({Key? key}) : super(key: key);

  @override
  State<GenerateVideo> createState() => _GenerateVideoState();
}

class _GenerateVideoState extends State<GenerateVideo> {
  final List<Animal> all = allAnimals;
  void generateVideo() {}

  void customSecondVideo(double val) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Generate Video'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                ...all.map((item) => Container(
                      width: 120,
                      height: 120,
                      child: Image.asset(item.imageUrl),
                    ))
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              child: Container(
                width: 120,
                height: 40,
                color: Colors.blue,
                child: Text("Click Me"),
              ),
              onTap: () => generateVideo(),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
