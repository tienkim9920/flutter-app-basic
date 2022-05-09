import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
  late Map<dynamic, dynamic> data = {};
  ChecklistModel checklistModel = ChecklistModel();
  ChecklistValidation checklistValidation = ChecklistValidation();

  String messSuccess = '';
  bool submitted = false;

  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 1),
    //   () => print(data['view']));
    super.initState();
  }

  handleValidation() {
    if (checklistValidation.name != '' &&
        checklistValidation.price != '' &&
        checklistValidation.quantity != '' &&
        checklistValidation.description != '' &&
        checklistValidation.location != '' &&
        checklistValidation.employeeImport != '' &&
        !!RegExp(r'[0-9]').hasMatch(checklistValidation.quantity.toString()) &&
        !!RegExp(r'[0-9]').hasMatch(checklistValidation.price.toString()) &&
        !!RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(checklistValidation.employeeImport.toString())) {
      return true;
    }
    return false;
  }

  resetValidation() {
    checklistValidation.name = '';
    checklistValidation.price = '';
    checklistValidation.quantity = '';
    checklistValidation.description = '';
    checklistValidation.location = '';
    checklistValidation.employeeImport = '';
    submitted = false;
  }

  handleCreateChecklist() async {
    bool validate = handleValidation();
    if (!validate) {
      setState(() {
        submitted = true;
        messSuccess = '';
      });
      return;
    }
    await ChecklistService().postChecklist(
        ChecklistMapping().MapServiceAddChecklist(checklistModel));
    setState(() {
      messSuccess = 'Bạn Đã Thêm Thành Công';
      checklistModel.name.text = '';
      checklistModel.price.text = '';
      checklistModel.quantity.text = '';
      checklistModel.description.text = '';
      checklistModel.location.text = '';
      checklistModel.employeeImport.text = '';
      resetValidation();
    });
  }

  bool flagUpdate = false;

  handleUpdateChecklist(String id) async {
    bool validate = handleValidation();
    if (!validate) {
      setState(() {
        submitted = true;
        messSuccess = '';
      });
      return;
    }
    setState(() {
      checklistModel.name.text = checklistModel.name.text;
      checklistModel.price.text = checklistModel.price.text;
      checklistModel.quantity.text = checklistModel.quantity.text;
      checklistModel.description.text = checklistModel.description.text;
      checklistModel.location.text = checklistModel.location.text;
      checklistModel.employeeImport.text = checklistModel.employeeImport.text;
      messSuccess = 'Bạn Đã Chỉnh Sửa Thành Công';
    });
    checklistModel.id = id;
    await ChecklistService().updateChecklist(
        ChecklistMapping().MapServiceUpdateChecklist(checklistModel));
  }

  gobackChecklist() {}

  redirectLocation() async {
    await launch(
        'https://www.google.com/maps/place/${checklistModel.location.text}');
  }

  redirectMail() async {
    await launch(
        'mailto:${checklistModel.employeeImport.text}?subject=Subject mail&body=Body mail');
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    if (data['view'] != 'create' && !flagUpdate) {
      checklistModel.name.text = data['name'];
      checklistModel.price.text = data['price'];
      checklistModel.quantity.text = data['quantity'];
      checklistModel.description.text = data['description'];
      checklistModel.location.text = data['location'];
      checklistModel.employeeImport.text = data['employeeImport'];

      checklistValidation.name = data['name'];
      checklistValidation.price = data['price'];
      checklistValidation.quantity = data['quantity'];
      checklistValidation.description = data['description'];
      checklistValidation.location = data['location'];
      checklistValidation.employeeImport = data['employeeImport'];

      setState(() {
        flagUpdate = true;
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: TextField(
                controller: checklistModel.name,
                decoration: InputDecoration(
                    labelText: 'Tên Mô Tô',
                    errorText: checklistValidation.name == '' && submitted
                        ? 'Vui lòng nhập tên Mô Tô'
                        : null),
                onChanged: (text) => setState(() {
                  checklistValidation.name = text;
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: TextField(
                controller: checklistModel.price,
                decoration: InputDecoration(
                    labelText: 'Giá Moto',
                    errorText: checklistValidation.price == '' && submitted
                        ? 'Vui lòng nhập giá Mô Tô'
                        : !RegExp(r'[0-9]').hasMatch(
                                    checklistValidation.price.toString()) &&
                                submitted
                            ? 'Định dạng sai thông tin'
                            : null),
                onChanged: (text) => setState(() {
                  checklistValidation.price = text;
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: TextField(
                controller: checklistModel.quantity,
                decoration: InputDecoration(
                    labelText: 'Số lượng',
                    errorText: checklistValidation.quantity == '' && submitted
                        ? 'Vui lòng nhập số lượng Mô Tô'
                        : !RegExp(r'[0-9]').hasMatch(
                                    checklistValidation.quantity.toString()) &&
                                submitted
                            ? 'Định dạng sai thông tin'
                            : null),
                onChanged: (text) => setState(() {
                  checklistValidation.quantity = text;
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: TextField(
                controller: checklistModel.description,
                decoration: InputDecoration(
                    labelText: 'Mô tả',
                    errorText:
                        checklistValidation.description == '' && submitted
                            ? 'Vui lòng nhập mô tả Mô Tô'
                            : null),
                onChanged: (text) => setState(() {
                  checklistValidation.description = text;
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: TextField(
                controller: checklistModel.location,
                decoration: InputDecoration(
                    labelText: 'Địa chỉ',
                    errorText: checklistValidation.location == '' && submitted
                        ? 'Vui lòng nhập địa chỉ Mô Tô'
                        : null),
                onChanged: (text) => setState(() {
                  checklistValidation.location = text;
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: TextField(
                controller: checklistModel.employeeImport,
                decoration: InputDecoration(
                    labelText: 'Email nhân viên',
                    errorText: checklistValidation.employeeImport == '' &&
                            submitted
                        ? 'Vui lòng nhập Email nhân viên'
                        : !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                    .hasMatch(checklistValidation.employeeImport
                                        .toString()) &&
                                submitted
                            ? 'Định dạng sai thông tin'
                            : null),
                onChanged: (text) => setState(() {
                  checklistValidation.employeeImport = text;
                }),
              ),
            ),
            SizedBox(height: 20),
            if (data['view'] != 'create') ...[
              ButtonIcon(20, 20, 'Vị Trí', 'vitri', (id) => redirectLocation(),
                  Icons.place, true, true),
              SizedBox(height: 20),
            ],
            if (data['view'] != 'create') ...[
              ButtonIcon(20, 20, 'Gmail', 'gmail', (id) => redirectMail(),
                  Icons.email, true, true),
              SizedBox(height: 20),
            ],
            ButtonIcon(
                20,
                20,
                data['view'] == 'create' ? 'Thêm' : 'Chỉnh sửa',
                data['view'] == 'create' ? 'create' : data['view'],
                data['view'] == 'create'
                    ? (id) => handleCreateChecklist()
                    : (id) => handleUpdateChecklist(id),
                data['view'] == 'create' ? Icons.create : Icons.update,
                true,
                true),
            SizedBox(height: 20),
            Text(messSuccess,
                style: TextStyle(
                    color: Color.fromRGBO(48, 135, 189, 1), fontSize: 20))
          ],
        ),
      ),
    );
  }
}
