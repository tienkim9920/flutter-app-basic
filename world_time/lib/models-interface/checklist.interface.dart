class ChecklistInterface {
  String? category; //p0 tienkim
  String? name; //p1
  String? content; //p2
  String? hour; //p3
  String? minutes; //p4
  String? current; //p5
  String? week; //p0

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['p0'] = this.category;
    data['p1'] = this.name;
    data['p2'] = this.content;
    data['p3'] = this.hour;
    data['p4'] = this.minutes;
    data['p5'] = this.current;
    data['p6'] = this.week;
    return data;
  }
}
