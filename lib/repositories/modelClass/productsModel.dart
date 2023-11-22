class ProductsModel {
  ProductsModel({
    this.id,
    this.units,
    this.products,
    this.vendorBillNumber,
    this.quantity,
    this.purchaseAmount,
    this.sellingAmount,
    this.manufactureDate,
    this.expiryDate,
    this.time,});

  ProductsModel.fromJson(dynamic json) {
    id = json['id'];
    units = json['units'] != null ? Units.fromJson(json['units']) : null;
    products = json['products'] != null ? Products.fromJson(json['products']) : null;
    vendorBillNumber = json['vendor_bill_number'];
    quantity = json['quantity'];
    purchaseAmount = json['purchase_amount'];
    sellingAmount = json['selling_amount'];
    manufactureDate = json['manufacture_date'];
    expiryDate = json['expiry_date'];
    time = json['time'];
  }
  int? id;
  Units? units;
  Products? products;
  dynamic vendorBillNumber;
  int? quantity;
  dynamic purchaseAmount;
  String? sellingAmount;
  String? manufactureDate;
  String? expiryDate;
  String? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (units != null) {
      map['units'] = units?.toJson();
    }
    if (products != null) {
      map['products'] = products?.toJson();
    }
    map['vendor_bill_number'] = vendorBillNumber;
    map['quantity'] = quantity;
    map['purchase_amount'] = purchaseAmount;
    map['selling_amount'] = sellingAmount;
    map['manufacture_date'] = manufactureDate;
    map['expiry_date'] = expiryDate;
    map['time'] = time;
    return map;
  }
  static List<ProductsModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => ProductsModel.fromJson(value)).toList();
  }
}

class Products {
  Products({
    this.id,
    this.units,
    this.category,
    this.name,
    this.isForSale,
    this.image,
    this.productCode,
    this.tax,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    units = json['units'] != null ? Units.fromJson(json['units']) : null;
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    name = json['name'];
    isForSale = json['is_for_sale'];
    image = json['image'];
    productCode = json['product_code'];
    tax = json['tax'];
  }
  int? id;
  Units? units;
  Category? category;
  String? name;
  bool? isForSale;
  String? image;
  String? productCode;
  int? tax;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (units != null) {
      map['units'] = units?.toJson();
    }
    if (category != null) {
      map['category'] = category?.toJson();
    }
    map['name'] = name;
    map['is_for_sale'] = isForSale;
    map['image'] = image;
    map['product_code'] = productCode;
    map['tax'] = tax;
    return map;
  }

}

class Category {
  Category({
    this.id,
    this.name,
    this.img,});

  Category.fromJson(dynamic json) {
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

}

class Units {
  Units({
    this.id,
    this.name,
    this.value,});

  Units.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
  }
  int? id;
  String? name;
  int? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['value'] = value;
    return map;
    }



}