import 'dart:convert';
import 'package:world_time/models-interface/checklist.interface.dart';
import 'package:world_time/models/checklist.model.dart';

class ChecklistMapping {
  dynamic MapServiceAddChecklist(ChecklistModel model) {
    ChecklistInterface checklist = ChecklistInterface();
    checklist.category = 'tienkim';
    checklist.name = model.name.text;
    checklist.address = model.address.text;
    checklist.email = model.email.text;
    checklist.product = model.product.text;
    checklist.total = model.total.text;
    checklist.status = '0';

    var url =
        'http://api.phanmemquocbao.com/api/Doituong/InsertObjects?p0=${checklist.category}&p1=${checklist.name}&p2=${checklist.address}&p3=${checklist.email}&p4=${checklist.product}&p5=${checklist.total}&p6=${checklist.status}&tokenin=lethibaotran';

    print(url);

    return url;
  }

  dynamic MapServiceUpdateChecklist(ChecklistModel model) {
    ChecklistInterface checklist = ChecklistInterface();
    checklist.category = 'tienkim';
    checklist.name = model.name.text;
    checklist.address = model.address.text;
    checklist.email = model.email.text;
    checklist.product = model.product.text;
    checklist.total = model.total.text;
    checklist.status = model.status;

    var url =
        'http://api.phanmemquocbao.com/api/Doituong/updateObjects?id=${model.id}&p0=${checklist.category}&p1=${checklist.name}&p2=${checklist.address}&p3=${checklist.email}&p4=${checklist.product}&p5=${checklist.total}&p6=${checklist.status}&tokenup=lethibaotran';

    return url;
  }
}
