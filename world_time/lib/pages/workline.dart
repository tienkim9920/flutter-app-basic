import 'package:flutter/material.dart';
import 'package:world_time/component/line.component.dart';
import 'package:world_time/models/data_color.dart';
import 'package:world_time/pattern/checklist.pattern.dart';
import 'package:world_time/service/checklist.service.dart';

class WorkLine extends StatefulWidget {
  const WorkLine({Key? key}) : super(key: key);

  @override
  State<WorkLine> createState() => _WorkLineState();
}

class _WorkLineState extends State<WorkLine> {
  // List checklist
  List<dynamic> checklists = [];
  List<dynamic> monday = [];
  List<dynamic> tuesday = [];
  List<dynamic> wednesday = [];

  @override
  void initState() {
    getChecklistData();
    super.initState();
  }

  getChecklistData() async {
    var res = await ChecklistService().getChecklists();
    setState(() {
      checklists.addAll([
        {'Id': 1},
        ...cloneData(res)
      ]);
    });
  }

  cloneData(List<dynamic> data) {
    return data.where((element) => element['p0'] == 'tienkim').toList();
  }

  void removeChecklist(dynamic data) {
    checklists.removeWhere((element) => element['Id'] == data['Id']);
    monday.removeWhere((element) => element['Id'] == data['Id']);
    tuesday.removeWhere((element) => element['Id'] == data['Id']);
    wednesday.removeWhere((element) => element['Id'] == data['Id']);
  }

  void handleMonday(dynamic data) {
    setState(() {
      if (data['Id'] == 1) {
        return;
      }
      removeChecklist(data);
      monday.add(data);
    });
  }

  void handleTuesday(dynamic data) {
    setState(() {
      if (data['Id'] == 1) {
        return;
      }
      removeChecklist(data);
      tuesday.add(data);
    });
  }

  void handleWednesday(dynamic data) {
    setState(() {
      if (data['Id'] == 1) {
        return;
      }
      removeChecklist(data);
      wednesday.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(48, 135, 189, 1),
          title: Text('Lên Lịch Trình'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 420,
                child: Column(
                  children: [
                    LineComponent(
                        'Thứ 2', monday, (data) => handleMonday(data)),
                    SizedBox(height: 8.0),
                    LineComponent(
                        'Thứ 3', tuesday, (data) => handleTuesday(data)),
                    SizedBox(height: 8.0),
                    LineComponent(
                        'Thứ 4', wednesday, (data) => handleWednesday(data)),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 300,
                child: ListView(scrollDirection: Axis.vertical, children: [
                  Column(
                    children: [
                      ...checklists.map(
                        (item) => DragTarget(
                          builder: (context, candidateData, rejectedData) =>
                              item['Id'] == 1
                                  ? buildImageStatic()
                                  : Draggable(
                                      data: item,
                                      child: buildImageRoot(item),
                                      feedback: buildImageRoot(item)),
                          onWillAccept: (data) => true,
                          onAccept: (dynamic data) {
                            setState(() {
                              if (data['Id'] == 1) {
                                return;
                              }
                              removeChecklist(data);
                              checklists.add(data);
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ));
  }

  Widget buildImageRoot(dynamic data) => Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 60,
      color: Color.fromRGBO(48, 135, 189, 1),
      margin: EdgeInsets.only(top: 6),
      padding: EdgeInsets.all(5),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          data['p1'],
          style: TextStyle(fontSize: 18, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data['p2'],
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              '${data['p3']}h${data['p4']} ${data['p5']}',
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        )
      ]));

  Widget buildImageStatic() => Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 75,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sắp Xếp Công Việc',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
}
