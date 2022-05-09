import 'dart:convert';
import 'package:world_time/models-interface/checklist.interface.dart';
import 'package:world_time/models/checklist.model.dart';

class ChecklistMapping {
  dynamic MapServiceAddChecklist(ChecklistModel model) {
    ChecklistInterface checklist = ChecklistInterface();
    checklist.category = 'toannguyen';
    checklist.name = model.name.text;
    checklist.price = model.price.text;
    checklist.quantity = model.quantity.text;
    checklist.description = model.description.text;
    checklist.location = model.location.text;
    checklist.employeeImport = model.employeeImport.text;

    var url =
        'http://api.phanmemquocbao.com/api/Doituong/InsertObjects?p0=${checklist.category}&p1=${checklist.name}&p2=${checklist.price}&p3=${checklist.quantity}&p4=${checklist.description}&p5=${checklist.location}&p6=${checklist.employeeImport}&tokenin=lethibaotran';

    print(url);

    return url;
  }

  dynamic MapServiceUpdateChecklist(ChecklistModel model) {
    ChecklistInterface checklist = ChecklistInterface();
    checklist.category = 'toannguyen';
    checklist.name = model.name.text;
    checklist.price = model.price.text;
    checklist.quantity = model.quantity.text;
    checklist.description = model.description.text;
    checklist.location = model.location.text;
    checklist.employeeImport = model.employeeImport.text;

    var url =
        'http://api.phanmemquocbao.com/api/Doituong/updateObjects?id=${model.id}&p0=${checklist.category}&p1=${checklist.name}&p2=${checklist.price}&p3=${checklist.quantity}&p4=${checklist.description}&p5=${checklist.location}&p6=${checklist.employeeImport}&tokenup=lethibaotran';

    return url;
  }
}
