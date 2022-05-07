import 'package:flutter/material.dart';
import 'package:world_time/pages/checklist.detail.dart';
import 'package:world_time/pages/checklist.page.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
// import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/timeline.dart';
import 'package:world_time/pages/workline.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      // '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
      '/checklist': (context) => ChecklistPage(),
      '/checklist/detail': (context) => ChecklistDetail(),
      '/timeline': (context) => TimeLine(),
      '/workline': (context) => WorkLine(),
    },
  ));
}
