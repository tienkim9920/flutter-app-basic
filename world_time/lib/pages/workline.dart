import 'package:flutter/material.dart';
import 'package:world_time/component/line.component.dart';
import 'package:world_time/mapping/checklist.mapping.dart';
import 'package:world_time/models/checklist.model.dart';
import 'package:world_time/models/data_color.dart';
import 'package:world_time/pattern/checklist.pattern.dart';
import 'package:world_time/service/checklist.service.dart';

class WorkLine extends StatefulWidget {
  const WorkLine({Key? key}) : super(key: key);

  @override
  State<WorkLine> createState() => _WorkLineState();
}

class _WorkLineState extends State<WorkLine> {
  List<dynamic> todo = [];
  List<dynamic> inProgress = [];
  List<dynamic> done = [];

  @override
  void initState() {
    getChecklistData();
    super.initState();
  }

  getChecklistData() async {
    var res = await ChecklistService().getChecklists();
    setState(() {
      todo.addAll([
        {'Id': 'todo'},
        ...cloneTodo(res)
      ]);
      inProgress.addAll([
        {'Id': 'inProgress'},
        ...cloneInProgress(res)
      ]);
      done.addAll([
        {'Id': 'done'},
        ...cloneDone(res)
      ]);
    });
  }

  cloneTodo(List<dynamic> data) {
    return data
        .where((element) => element['p0'] == 'tienkim' && element['p6'] == '0')
        .toList();
  }

  cloneInProgress(List<dynamic> data) {
    return data
        .where((element) => element['p0'] == 'tienkim' && element['p6'] == '1')
        .toList();
  }

  cloneDone(List<dynamic> data) {
    return data
        .where((element) => element['p0'] == 'tienkim' && element['p6'] == '2')
        .toList();
  }

  void removeChecklist(dynamic data) {
    todo.removeWhere((element) => element['Id'] == data['Id']);
    inProgress.removeWhere((element) => element['Id'] == data['Id']);
    done.removeWhere((element) => element['Id'] == data['Id']);
  }

  void handleTodo(dynamic data) {
    setState(() {
      if (data['Id'] == 'todo') {
        return;
      }
      createModel(data, '0');
      removeChecklist(data);
      todo.add(data);
    });
  }

  void handleInProgress(dynamic data) {
    setState(() {
      if (data['Id'] == 'inProgress') {
        return;
      }
      createModel(data, '1');
      removeChecklist(data);
      inProgress.add(data);
    });
  }

  void handleDone(dynamic data) {
    setState(() {
      if (data['Id'] == 'done') {
        return;
      }
      createModel(data, '2');
      removeChecklist(data);
      done.add(data);
    });
  }

  void createModel(dynamic data, String status) {
    ChecklistModel checklistModel = ChecklistModel();
    checklistModel.id = data['Id'].toString();
    checklistModel.name.text = data['p1'];
    checklistModel.address.text = data['p2'];
    checklistModel.email.text = data['p3'];
    checklistModel.product.text = data['p4'];
    checklistModel.total.text = data['p5'];
    checklistModel.status = status;
    ChecklistService().updateChecklist(
        ChecklistMapping().MapServiceUpdateChecklist(checklistModel));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: Color(0xFF3087BD),
          title: Text('Quản lý hóa đơn'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDragDrop(
                    todo, 'todo', 'Đang xử lý', (data) => handleTodo(data)),
                SizedBox(height: 10),
                buildDragDrop(inProgress, 'inProgress', 'Đang vận chuyển',
                    (data) => handleInProgress(data)),
                SizedBox(height: 10),
                buildDragDrop(
                    done, 'done', 'Hoàn Thành', (data) => handleDone(data))
              ],
            ),
          ),
        ));
  }

  Widget buildImageRoot(dynamic data) => Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 50,
      color: Color(0xFFDFDFDF),
      padding: EdgeInsets.all(5),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          data['p1'],
          style: TextStyle(fontSize: 18, decoration: TextDecoration.none),
          textAlign: TextAlign.center,
        ),
        Text(
          data['p2'],
          style: TextStyle(fontSize: 16, decoration: TextDecoration.none),
          textAlign: TextAlign.center,
        )
      ]));

  Widget buildImageStatic(String text) => Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 50,
        color: Color(0xFF3087BD),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );

  Widget buildDragDrop(List<dynamic> data, String idColum, textColum,
          Function handleEvent) =>
      Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        child: ListView(scrollDirection: Axis.vertical, children: [
          Column(
            children: [
              ...data.map(
                (item) => DragTarget(
                  builder: (context, candidateData, rejectedData) =>
                      item['Id'] == idColum
                          ? buildImageStatic(textColum)
                          : Draggable(
                              data: item,
                              child: buildImageRoot(item),
                              feedback: buildImageRoot(item)),
                  onWillAccept: (data) => true,
                  onAccept: (dynamic data) => handleEvent(data),
                ),
              )
            ],
          ),
        ]),
      );
}
