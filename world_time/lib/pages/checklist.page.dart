import 'package:flutter/material.dart';
import 'package:world_time/component/button.component.dart';
import 'package:world_time/component/checklist.component.dart';
import 'package:world_time/models/checklist.model.dart';
import 'package:world_time/service/checklist.service.dart';

class ChecklistPage extends StatefulWidget {
  const ChecklistPage({Key? key}) : super(key: key);

  @override
  _ChecklistPageState createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  // List checklist
  List<dynamic> checklists = [];

  @override
  void initState() {
    getChecklistData();
    super.initState();
  }

  getChecklistData() async {
    var res = await ChecklistService().getChecklists();
    setState(() {
      checklists = cloneData(res);
    });
  }

  cloneData(List<dynamic> data) {
    return data.where((element) => element['p0'] == 'toannguyen').toList();
  }

  gotoChecklistCreate() {
    Navigator.pushNamed(context, '/checklist/detail', arguments: {
      'view': 'create',
    }).then((_) => getChecklistData());
  }

  gotoChecklistDetail(String id) {
    dynamic data =
        checklists.singleWhere((element) => element['Id'].toString() == id);
    Navigator.pushNamed(context, '/checklist/detail', arguments: {
      'view': data['Id'].toString(),
      'name': data['p1'].toString(),
      'price': data['p2'].toString(),
      'quantity': data['p3'],
      'description': data['p4'],
      'location': data['p5'],
      'employeeImport': data['p6'],
    }).then((_) => getChecklistData());
  }

  void handleChecklistDelete(int id) async {
    int index = checklists.indexWhere((element) => element['Id'] == id);
    setState(() {
      checklists.removeAt(index);
    });
    await ChecklistService().deleteChecklist(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quản Lý Xe Moto'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(48, 135, 189, 1),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 15,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                children: [
                  ButtonIcon(20, 20, 'Tạo Mới Xe Moto', 'create',
                      (id) => gotoChecklistCreate(), Icons.create, true, true)
                ],
              ),
            ),
            Positioned(
              top: 75,
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  ...checklists
                      .map((e) => ChecklistComponent(
                          e,
                          (id) => handleChecklistDelete(id),
                          (id) => gotoChecklistDetail(id.toString())))
                      .toList(),
                ],
              ),
            )
          ],
        ));
  }
}
