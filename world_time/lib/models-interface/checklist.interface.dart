class ChecklistInterface {
  String? category; //p0 tienkim
  String? name; //p1
  String? address; //p2
  String? email; //p3
  String? product; //p4
  String? total; //p5
  String? status; //p0

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['p0'] = this.category;
    data['p1'] = this.name;
    data['p2'] = this.address;
    data['p3'] = this.email;
    data['p4'] = this.product;
    data['p5'] = this.total;
    data['p6'] = this.status;
    return data;
  }
}
