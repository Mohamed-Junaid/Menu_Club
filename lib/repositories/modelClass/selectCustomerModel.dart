class SelectCustomerModel {
  SelectCustomerModel({
      this.name, 
      this.phone, 
      this.place,});

  SelectCustomerModel.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    place = json['place'];
  }
  String? name;
  String? phone;
  String? place;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['place'] = place;
    return map;
  }
  static List<SelectCustomerModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => SelectCustomerModel.fromJson(value)).toList();
  }

}