import 'package:flutter/material.dart';
import 'package:world_time/models/data_color.dart';

class WorkLine extends StatefulWidget {
  const WorkLine({Key? key}) : super(key: key);

  @override
  State<WorkLine> createState() => _WorkLineState();
}

class _WorkLineState extends State<WorkLine> {
  List<CustomColors> colors = customColors;
  List<CustomColors> colorA = [];
  List<CustomColors> colorB = [];
  List<CustomColors> colorC = [];
  List<CustomColors> colorD = [];

  void removeItem(CustomColors data) {
    colors.removeWhere((element) => element.id == data.id);
    colorA.removeWhere((element) => element.id == data.id);
    colorB.removeWhere((element) => element.id == data.id);
    colorC.removeWhere((element) => element.id == data.id);
    colorD.removeWhere((element) => element.id == data.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEBEBEB),
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Time Line'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          child: Row(
            children: [
              Container(
                width: 195,
                height: 300,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      color: Colors.blue,
                      child: DragTarget(
                        builder: (context, candidateData, rejectedData) =>
                            Center(
                                child: Row(
                          children: [
                            ...colorA
                                .map((color) => Draggable(
                                    data: color,
                                    child: buildImage(color, colorA.length),
                                    feedback: buildImage(color, colorA.length)))
                                .toList(),
                          ],
                        )),
                        onWillAccept: (data) => true,
                        onAccept: (CustomColors data) {
                          setState(() {
                            removeItem(data);
                            colorA.add(data);
                          });
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      color: Colors.green,
                      child: DragTarget(
                        builder: (context, candidateData, rejectedData) =>
                            Center(
                                child: Stack(
                          children: [
                            ...colorB
                                .map((color) => Draggable(
                                    data: color,
                                    child: buildImage(color, colorB.length),
                                    feedback: buildImage(color, colorB.length)))
                                .toList(),
                          ],
                        )),
                        onWillAccept: (data) => true,
                        onAccept: (CustomColors data) {
                          setState(() {
                            removeItem(data);
                            colorB.add(data);
                          });
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      color: Colors.orange,
                      child: DragTarget(
                        builder: (context, candidateData, rejectedData) =>
                            Center(
                                child: Stack(
                          children: [
                            ...colorC
                                .map((color) => Draggable(
                                    data: color,
                                    child: buildImage(color, colorC.length),
                                    feedback: buildImage(color, colorC.length)))
                                .toList(),
                          ],
                        )),
                        onWillAccept: (data) => true,
                        onAccept: (CustomColors data) {
                          setState(() {
                            removeItem(data);
                            colorC.add(data);
                          });
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      color: Colors.pink,
                      child: DragTarget(
                        builder: (context, candidateData, rejectedData) =>
                            Center(
                                child: Stack(
                          children: [
                            ...colorD
                                .map((color) => Draggable(
                                    data: color,
                                    child: buildImage(color, colorD.length),
                                    feedback: buildImage(color, colorD.length)))
                                .toList(),
                          ],
                        )),
                        onWillAccept: (data) => true,
                        onAccept: (CustomColors data) {
                          setState(() {
                            removeItem(data);
                            colorD.add(data);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                width: 145,
                height: 300,
                child: Column(
                  children: [
                    ...colors.map(
                      (item) => DragTarget(
                        builder: (context, candidateData, rejectedData) =>
                            Draggable(
                                data: item,
                                child: buildImageRoot(item),
                                feedback: buildImageRoot(item)),
                        onWillAccept: (data) => true,
                        onAccept: (CustomColors data) {
                          setState(() {
                            removeItem(data);
                            colors.add(data);
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildImage(CustomColors colors, int count) =>
      Container(width: 195 / count, height: 75, color: colors.color);

  Widget buildImageRoot(CustomColors colors) =>
      Container(width: 195, height: 75, color: colors.color);
}
