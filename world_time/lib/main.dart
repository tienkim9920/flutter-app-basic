import 'package:flutter/material.dart';
import 'package:world_time/pages/book.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/timeline.dart';
import 'package:world_time/pages/workline.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
      '/book': (context) => Book(),
      '/timeline': (context) => TimeLine(),
      '/workline': (context) => WorkLine(),
    },
  ));
}
