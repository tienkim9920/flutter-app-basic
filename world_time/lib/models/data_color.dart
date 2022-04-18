import 'package:flutter/cupertino.dart';

class CustomColors {
  int id;
  Color color;

  CustomColors(this.id, this.color);
}

List<CustomColors> customColors = [
  CustomColors(1, Color.fromRGBO(255, 255, 255, 1)),
  CustomColors(2, Color.fromRGBO(0, 150, 136, 1)),
  CustomColors(3, Color.fromRGBO(68, 138, 255, 1)),
  CustomColors(4, Color.fromRGBO(244, 67, 54, 1)),
];
