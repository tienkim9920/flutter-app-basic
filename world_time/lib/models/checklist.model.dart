import 'package:flutter/cupertino.dart';

class ChecklistModel {
  String? id;
  String? category; //p0 toangnuyen
  TextEditingController name = TextEditingController(); //p1
  TextEditingController price = TextEditingController(); //p2
  TextEditingController quantity = TextEditingController(); //p3
  TextEditingController description = TextEditingController(); //p4
  TextEditingController location = TextEditingController(); //p5
  TextEditingController employeeImport = TextEditingController(); //p5
}

class ChecklistValidation {
  String name = ''; //p1
  String price = ''; //p2
  String quantity = ''; //p3
  String description = ''; //p4
  String location = ''; //p5
  String employeeImport = ''; //p5
}
