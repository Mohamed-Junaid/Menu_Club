class SelectTableModel {
  SelectTableModel({
      this.id, 
      this.tableNo, 
      this.tableStatus, 
      this.tableCapacity, 
      this.tableCondition, 
      this.waiter,});

  SelectTableModel.fromJson(dynamic json) {
    id = json['id'];
    tableNo = json['table_no'];
    tableStatus = json['table_status'];
    tableCapacity = json['table_capacity'];
    tableCondition = json['table_condition'];
    waiter = json['waiter'];
  }
  int? id;
  int? tableNo;
  String? tableStatus;
  int? tableCapacity;
  String? tableCondition;
  int? waiter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['table_no'] = tableNo;
    map['table_status'] = tableStatus;
    map['table_capacity'] = tableCapacity;
    map['table_condition'] = tableCondition;
    map['waiter'] = waiter;
    return map;
  }
  static List<SelectTableModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => SelectTableModel.fromJson(value)).toList();
  }
}