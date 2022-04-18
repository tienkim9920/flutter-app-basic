import 'package:flutter/material.dart';
import 'package:world_time/component/draggable_animal.dart';
import 'package:world_time/models/data_animals.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  final List<Animal> all = allAnimals;
  final List<Animal> land = [];
  final List<Animal> air = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Time Line'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          if (all.isNotEmpty) ...[buildOrigin()],
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 75,
                backgroundColor: Theme.of(context).primaryColor,
                child: DragTarget(
                  builder: (context, candidateData, rejectedData) => Center(
                      child: Stack(
                    children: [
                      ...land.map((animal) => DraggableAnimal(animal)).toList(),
                      Text('Animal')
                    ],
                  )),
                  onWillAccept: (data) => true,
                  onAccept: (Animal data) {
                    if (data.type == AnimalType.land) {
                      print("Animals");
                      setState(() {
                        all.removeWhere(
                            (animal) => data.imageUrl == animal.imageUrl);
                        land.add(data);
                      });
                    } else {
                      print("Invalid");
                    }
                  },
                ),
              ),
              CircleAvatar(
                radius: 75,
                backgroundColor: Theme.of(context).primaryColor,
                child: DragTarget(
                  builder: (context, candidateData, rejectedData) => Center(
                      child: Stack(
                    children: [
                      ...air.map((animal) => DraggableAnimal(animal)).toList(),
                      Text('Bird')
                    ],
                  )),
                  onWillAccept: (data) => true,
                  onAccept: (Animal data) {
                    if (data.type == AnimalType.air) {
                      print("Bird");
                      setState(() {
                        all.removeWhere(
                            (animal) => data.imageUrl == animal.imageUrl);
                        air.add(data);
                      });
                    } else {
                      print("Invalid");
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildOrigin() => Stack(
        children: all.map((animal) => DraggableAnimal(animal)).toList(),
      );
}
