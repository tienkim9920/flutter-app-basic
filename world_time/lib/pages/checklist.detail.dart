import 'package:flutter/material.dart';
import 'package:world_time/component/button.component.dart';
import 'package:world_time/mapping/checklist.mapping.dart';
import 'package:world_time/models/checklist.model.dart';
import 'package:world_time/service/checklist.service.dart';

class ChecklistDetail extends StatefulWidget {
  const ChecklistDetail({Key? key}) : super(key: key);

  @override
  State<ChecklistDetail> createState() => _ChecklistDetailState();
}

class _ChecklistDetailState extends State<ChecklistDetail> {
  List<String> dataHour = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  List<String> dataMinutes = [
    '5',
    '10',
    '15',
    '20',
    '25',
    '30',
    '35',
    '40',
    '45',
    '50',
    '55'
  ];
  List<String> dataCurrent = ['AM', 'PM'];
  late Map<dynamic, dynamic> data = {};
  ChecklistModel checklistModel = ChecklistModel();

  String messSuccess = '';

  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 1),
    //   () => print(data['view']));
    super.initState();
  }

  handleCreateChecklist() async {
    await ChecklistService().postChecklist(
        ChecklistMapping().MapServiceAddChecklist(checklistModel));
    setState(() {
      messSuccess = 'Bạn Đã Thêm Thành Công';
      checklistModel.name.text = '';
      checklistModel.content.text = '';
    });
  }

  bool flagUpdate = false;

  handleUpdateChecklist(String id) async {
    setState(() {
      checklistModel.name.text = checklistModel.name.text;
      checklistModel.content.text = checklistModel.content.text;
      messSuccess = 'Bạn Đã Chỉnh Sửa Thành Công';
      flagUpdate = true;
    });
    checklistModel.id = id;
    await ChecklistService().updateChecklist(
        ChecklistMapping().MapServiceUpdateChecklist(checklistModel));
  }

  gobackChecklist() {}

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    if (data['view'] != 'create' && !flagUpdate) {
      checklistModel.name.text = data['name'];
      checklistModel.content.text = data['content'];
      checklistModel.hour = data['hour'];
      checklistModel.minutes = data['minutes'];
      checklistModel.current = data['current'];
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color.fromRGBO(48, 135, 189, 1),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child:
                        Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    onTap: () => Navigator.pop(context, true),
                  ),
                ),
                Text(
                  data['view'] == 'create'
                      ? 'Tạo công việc'
                      : 'Chỉnh sửa công việc',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Container(
                  width: 1,
                  height: 1,
                  color: Color.fromRGBO(48, 135, 189, 1),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: TextField(
              controller: checklistModel.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tên công việc',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: TextField(
              controller: checklistModel.content,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Chi tiết công việc',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text('Giờ: ', style: TextStyle(fontSize: 20)),
                DropdownButton<String>(
                  value: checklistModel.hour,
                  elevation: 16,
                  style:
                      const TextStyle(color: Colors.deepPurple, fontSize: 20),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      checklistModel.hour = newValue!;
                      flagUpdate = true;
                    });
                  },
                  items: dataHour.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(width: 30),
                Text('Phút: ', style: TextStyle(fontSize: 20)),
                DropdownButton<String>(
                  value: checklistModel.minutes,
                  elevation: 16,
                  style:
                      const TextStyle(color: Colors.deepPurple, fontSize: 20),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      checklistModel.minutes = newValue!;
                      flagUpdate = true;
                    });
                  },
                  items:
                      dataMinutes.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(width: 30),
                Text('Buổi: ', style: TextStyle(fontSize: 20)),
                DropdownButton<String>(
                  value: checklistModel.current,
                  elevation: 16,
                  style:
                      const TextStyle(color: Colors.deepPurple, fontSize: 20),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      checklistModel.current = newValue!;
                      flagUpdate = true;
                    });
                  },
                  items:
                      dataCurrent.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ButtonIcon(
              20,
              20,
              data['view'] == 'create' ? 'Thêm' : 'Chỉnh sửa',
              data['view'] == 'create' ? 'create' : data['view'],
              data['view'] == 'create'
                  ? (id) => handleCreateChecklist()
                  : (id) => handleUpdateChecklist(id),
              data['view'] == 'create' ? Icons.create : Icons.update,
              true),
          SizedBox(height: 20),
          Text(messSuccess,
              style: TextStyle(
                  color: Color.fromRGBO(48, 135, 189, 1), fontSize: 20))
        ],
      ),
    );
  }
}
