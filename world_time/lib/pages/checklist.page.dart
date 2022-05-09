import 'package:flutter/material.dart';
import 'package:world_time/component/button.component.dart';
import 'package:world_time/component/checklist.component.dart';
import 'package:world_time/component/modal.component.dart';
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

  String currentId = '';
  bool modalShow = false;

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
    return data.where((element) => element['p0'] == 'tienkim').toList();
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
      'address': data['p2'].toString(),
      'email': data['p3'],
      'product': data['p4'],
      'total': data['p5'],
      'status': data['p6'],
    }).then((_) => getChecklistData());
  }

  void handleChecklistDelete(int id) async {
    int index = checklists.indexWhere((element) => element['Id'] == id);
    setState(() {
      checklists.removeAt(index);
      modalShow = false;
    });
    await ChecklistService().deleteChecklist(id);
  }

  void handleShowModal(String id) {
    setState(() {
      modalShow = true;
      currentId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Danh sách Đơn Hàng'),
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
                  ButtonIcon(20, 20, 'Tạo Mới Đơn Hàng', 'create',
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
                          (id) => handleShowModal(id.toString()),
                          (id) => gotoChecklistDetail(id.toString())))
                      .toList(),
                ],
              ),
            ),
            if (modalShow) ...[
              ModalCenter((id) => handleChecklistDelete(int.parse(id)),
                  () => setState(() => modalShow = false), currentId)
            ],
          ],
        ));
  }
}
