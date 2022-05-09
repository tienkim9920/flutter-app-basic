class ChecklistInterface {
  String? category; //p0 tienkim
  String? name; //p1
  String? price; //p2
  String? quantity; //p3
  String? description; //p4
  String? location; //p5
  String? employeeImport; //p0

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['p0'] = this.category;
    data['p1'] = this.name;
    data['p2'] = this.price;
    data['p3'] = this.quantity;
    data['p4'] = this.description;
    data['p5'] = this.location;
    data['p6'] = this.employeeImport;
    return data;
  }
}
