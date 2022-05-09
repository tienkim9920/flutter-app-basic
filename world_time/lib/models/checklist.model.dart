import 'package:flutter/cupertino.dart';

class ChecklistModel {
  String? id;
  String? category; //p0 toangnuyen
  TextEditingController name = TextEditingController(); //p1
  TextEditingController address = TextEditingController(); //p2
  TextEditingController email = TextEditingController(); //p3
  TextEditingController product = TextEditingController(); //p4
  TextEditingController total = TextEditingController(); //p5
  String? status; //p6
}

class ChecklistValidation {
  String name = ''; //p1
  String address = ''; //p2
  String email = ''; //p3
  String product = ''; //p4
  String total = ''; //p5
  String status = ''; //p6
}
