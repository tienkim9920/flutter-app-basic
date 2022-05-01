import 'package:flutter/cupertino.dart';

class ChecklistModel {
  String? id;
  String? category; //p0 tienkim
  TextEditingController name = TextEditingController(); //p1
  TextEditingController content = TextEditingController(); //p2
  String? hour; //p3
  String? minutes; //p4
  String? current; //p5
  String? week; //p5
}
