import 'dart:convert';
import 'package:world_time/models-interface/checklist.interface.dart';
import 'package:world_time/models/checklist.model.dart';

class ChecklistMapping {
  dynamic MapServiceAddChecklist(ChecklistModel model) {
    ChecklistInterface checklist = ChecklistInterface();
    checklist.category = 'tienkim';
    checklist.name = model.name.text;
    checklist.content = model.content.text;
    checklist.hour = model.hour;
    checklist.minutes = model.minutes;
    checklist.current = model.current;
    checklist.week = model.week;

    var url =
        'http://api.phanmemquocbao.com/api/Doituong/InsertObjects?p0=${checklist.category}&p1=${checklist.name}&p2=${checklist.content}&p3=${checklist.hour}&p4=${checklist.minutes}&p5=${checklist.current}&p6=${checklist.week}&tokenin=lethibaotran';

    return url;
  }

  dynamic MapServiceUpdateChecklist(ChecklistModel model) {
    ChecklistInterface checklist = ChecklistInterface();
    checklist.category = 'tienkim';
    checklist.name = model.name.text;
    checklist.content = model.content.text;
    checklist.hour = model.hour;
    checklist.minutes = model.minutes;
    checklist.current = model.current;
    checklist.week = model.week;

    var url =
        'http://api.phanmemquocbao.com/api/Doituong/updateObjects?id=${model.id}&p0=${checklist.category}&p1=${checklist.name}&p2=${checklist.content}&p3=${checklist.hour}&p4=${checklist.minutes}&p5=${checklist.current}&p6=${checklist.week}&tokenup=lethibaotran';

    return url;
  }
}
