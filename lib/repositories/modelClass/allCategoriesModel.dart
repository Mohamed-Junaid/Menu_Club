class AllCategoriesModel {
  AllCategoriesModel({
      this.id, 
      this.name, 
      this.img,});

  AllCategoriesModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
  }
  int? id;
  String? name;
  String? img;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['img'] = img;
    return map;
  }
  static List<AllCategoriesModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => AllCategoriesModel.fromJson(value)).toList();
  }

}