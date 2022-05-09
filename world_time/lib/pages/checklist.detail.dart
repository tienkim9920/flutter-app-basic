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
        checklistValidation.address != '' &&
        checklistValidation.product != '' &&
        !!RegExp(r'[0-9]').hasMatch(checklistValidation.total.toString()) &&
        !!RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(checklistValidation.email.toString())) {
      return true;
    }
    return false;
  }

  resetValidation() {
    checklistValidation.name = '';
    checklistValidation.address = '';
    checklistValidation.email = '';
    checklistValidation.product = '';
    checklistValidation.total = '';
    checklistValidation.status = '0';
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
      checklistModel.address.text = '';
      checklistModel.email.text = '';
      checklistModel.product.text = '';
      checklistModel.total.text = '';
      checklistModel.status = '0';
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
      checklistModel.address.text = checklistModel.address.text;
      checklistModel.email.text = checklistModel.email.text;
      checklistModel.product.text = checklistModel.product.text;
      checklistModel.total.text = checklistModel.total.text;
      messSuccess = 'Bạn Đã Chỉnh Sửa Thành Công';
    });
    checklistModel.id = id;
    await ChecklistService().updateChecklist(
        ChecklistMapping().MapServiceUpdateChecklist(checklistModel));
  }

  gobackChecklist() {}

  redirectAddress() async {
    await launch(
        'https://www.google.com/maps/place/${checklistModel.address.text}');
  }

  redirectMail() async {
    await launch(
        'mailto:${checklistModel.email.text}?subject=Subject mail&body=Body mail');
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    if (data['view'] != 'create' && !flagUpdate) {
      checklistModel.name.text = data['name'];
      checklistModel.address.text = data['address'];
      checklistModel.email.text = data['email'];
      checklistModel.product.text = data['product'];
      checklistModel.total.text = data['total'];
      checklistModel.status = data['status'];

      checklistValidation.name = data['name'];
      checklistValidation.address = data['address'];
      checklistValidation.email = data['email'];
      checklistValidation.product = data['product'];
      checklistValidation.total = data['total'];

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
                        ? 'Tạo đơn hàng'
                        : 'Chỉnh sửa đơn hàng',
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: checklistModel.name,
                decoration: InputDecoration(
                    labelText: 'Tên Đơn Hàng',
                    errorText: checklistValidation.name == '' && submitted
                        ? 'Vui lòng nhập tên đơn hàng'
                        : null),
                onChanged: (text) => setState(() {
                  checklistValidation.name = text;
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: checklistModel.address,
                decoration: InputDecoration(
                    labelText: 'Địa chỉ nhận hàng',
                    errorText: checklistValidation.address == '' && submitted
                        ? 'Vui lòng nhập địa chỉ nhận hàng'
                        : null),
                onChanged: (text) => setState(() {
                  checklistValidation.address = text;
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: checklistModel.email,
                decoration: InputDecoration(
                    labelText: 'Email nhận hàng',
                    errorText: checklistValidation.email == '' && submitted
                        ? 'Vui lòng nhập Email nhận hàng'
                        : !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                    .hasMatch(
                                        checklistValidation.email.toString()) &&
                                submitted
                            ? 'Định dạng sai thông tin'
                            : null),
                onChanged: (text) => setState(() {
                  checklistValidation.email = text;
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: checklistModel.product,
                decoration: InputDecoration(
                    labelText: 'Sản phẩm Mua',
                    errorText: checklistValidation.product == '' && submitted
                        ? 'Vui lòng nhập sản phẩm mua'
                        : null),
                onChanged: (text) => setState(() {
                  checklistValidation.product = text;
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: checklistModel.total,
                decoration: InputDecoration(
                    labelText: 'Tổng tiền đơn hàng',
                    errorText: checklistValidation.total == '' && submitted
                        ? 'Vui lòng nhập tổng tiền đơn hàng'
                        : !RegExp(r'[0-9]').hasMatch(
                                    checklistValidation.total.toString()) &&
                                submitted
                            ? 'Định dạng sai thông tin'
                            : null),
                onChanged: (text) => setState(() {
                  checklistValidation.total = text;
                }),
              ),
            ),
            SizedBox(height: 20),
            if (data['view'] != 'create') ...[
              ButtonIcon(20, 20, 'Vị Trí', 'vitri', (id) => redirectAddress(),
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
