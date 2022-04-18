import 'package:flutter/material.dart';
import 'package:world_time/models/data_animals.dart';

class DraggableAnimal extends StatelessWidget {
  final Animal animal;

  const DraggableAnimal(this.animal, {Key? key}) : super(key: key);

  static double size = 150;

  @override
  Widget build(BuildContext context) {
    return Draggable<Animal>(
      data: animal,
      child: buildImage(),
      feedback: buildImage(),
      // childWhenDragging: Container(
      //   width: 250,
      //   height: 250,
      // ),
    );
  }

  Widget buildImage() => Container(
        width: 250,
        height: 250,
        child: Image.asset(animal.imageUrl),
      );
}
