class AllBillsModel {
  AllBillsModel({
      this.id, 
      this.billDetails, 
      this.createdAt, 
      this.waiter, 
      this.billingStaff,});

  AllBillsModel.fromJson(dynamic json) {
    id = json['id'];
    billDetails = json['bill_details'] != null ? BillDetails.fromJson(json['bill_details']) : null;
    createdAt = json['created_at'];
    waiter = json['waiter'];
    billingStaff = json['billing_staff'];
  }
  int? id;
  BillDetails? billDetails;
  String? createdAt;
  int? waiter;
  int? billingStaff;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (billDetails != null) {
      map['bill_details'] = billDetails?.toJson();
    }
    map['created_at'] = createdAt;
    map['waiter'] = waiter;
    map['billing_staff'] = billingStaff;
    return map;
  }
  static List<AllBillsModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => AllBillsModel.fromJson(value)).toList();
  }
}

class BillDetails {
  BillDetails({
      this.kot, 
      this.order, 
      this.table, 
      this.waiter, 
      this.comment, 
      this.customer, 
      this.discount, 
      this.subTotal, 
      this.holdingId, 
      this.billStatus, 
      this.totalAmount, 
      this.billingStaff, 
      this.referenceCode, 
      this.paymentMethod, 
      this.selectedProducts,});

  BillDetails.fromJson(dynamic json) {
    kot = json['kot'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    table = json['table'] != null ? Table.fromJson(json['table']) : null;
    waiter = json['waiter'];
    comment = json['comment'] != null ? Comment.fromJson(json['comment']) : null;
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    discount = json['discount'] != null ? Discount.fromJson(json['discount']) : null;
    subTotal = json['subTotal'];
    holdingId = json['holdingId'];
    billStatus = json['bill_status'];
    totalAmount = json['totalAmount'];
    billingStaff = json['billing_staff'];
    referenceCode = json['referenceCode'];
    paymentMethod = json['payment_method'];
    if (json['selectedProducts'] != null) {
      selectedProducts = [];
      json['selectedProducts'].forEach((v) {
        selectedProducts?.add(SelectedProducts.fromJson(v));
      });
    }
  }
  bool? kot;
  Order? order;
  Table? table;
  int? waiter;
  Comment? comment;
  Customer? customer;
  Discount? discount;
  String? subTotal;
  int? holdingId;
  String? billStatus;
  String? totalAmount;
  int? billingStaff;
  String? referenceCode;
  String? paymentMethod;
  List<SelectedProducts>? selectedProducts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kot'] = kot;
    if (order != null) {
      map['order'] = order?.toJson();
    }
    if (table != null) {
      map['table'] = table?.toJson();
    }
    map['waiter'] = waiter;
    if (comment != null) {
      map['comment'] = comment?.toJson();
    }
    if (customer != null) {
      map['customer'] = customer?.toJson();
    }
    if (discount != null) {
      map['discount'] = discount?.toJson();
    }
    map['subTotal'] = subTotal;
    map['holdingId'] = holdingId;
    map['bill_status'] = billStatus;
    map['totalAmount'] = totalAmount;
    map['billing_staff'] = billingStaff;
    map['referenceCode'] = referenceCode;
    map['payment_method'] = paymentMethod;
    if (selectedProducts != null) {
      map['selectedProducts'] = selectedProducts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class SelectedProducts {
  SelectedProducts({
      this.id, 
      this.image, 
      this.price, 
      this.total, 
      this.delete, 
      this.pName, 
      this.attrAdd, 
      this.quantity, 
      this.attrName, 
      this.attrExtra, 
      this.attributeId, 
      this.deletedFrom, 
      this.oldQuantity, 
      this.productType, 
      this.productStatus, 
      this.extraDeletedFrom, 
      this.addOnDeletedFrom,});

  SelectedProducts.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    price = json['price'];
    total = json['total'];
    delete = json['delete'];
    pName = json['p_name'];
    attrAdd = json['attr_add'];
    quantity = json['quantity'];
    attrName = json['attr_name'];
    attrExtra = json['attr_extra'];
    attributeId = json['attributeId'];
    deletedFrom = json['deleted_from'];
    oldQuantity = json['old_quantity'];
    productType = json['product_type'];
    productStatus = json['product_status'];
    extraDeletedFrom = json['extra_deleted_from'];
    addOnDeletedFrom = json['add_on_deleted_from'];
  }
  int? id;
  String? image;
  String? price;
  String? total;
  bool? delete;
  String? pName;
  String? attrAdd;
  int? quantity;
  String? attrName;
  String? attrExtra;
  dynamic attributeId;
  String? deletedFrom;
  int? oldQuantity;
  String? productType;
  String? productStatus;
  String? extraDeletedFrom;
  String? addOnDeletedFrom;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['price'] = price;
    map['total'] = total;
    map['delete'] = delete;
    map['p_name'] = pName;
    map['attr_add'] = attrAdd;
    map['quantity'] = quantity;
    map['attr_name'] = attrName;
    map['attr_extra'] = attrExtra;
    map['attributeId'] = attributeId;
    map['deleted_from'] = deletedFrom;
    map['old_quantity'] = oldQuantity;
    map['product_type'] = productType;
    map['product_status'] = productStatus;
    map['extra_deleted_from'] = extraDeletedFrom;
    map['add_on_deleted_from'] = addOnDeletedFrom;
    return map;
  }

}

class Discount {
  Discount({
      this.type, 
      this.value, 
      this.discountedPrice,});

  Discount.fromJson(dynamic json) {
    type = json['type'];
    value = json['value'];
    discountedPrice = json['discountedPrice'];
  }
  String? type;
  int? value;
  int? discountedPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['value'] = value;
    map['discountedPrice'] = discountedPrice;
    return map;
  }

}

class Customer {
  Customer({
      this.customerId, 
      this.customerName,});

  Customer.fromJson(dynamic json) {
    customerId = json['customer_id'];
    customerName = json['customer_name'];
  }
  String? customerId;
  String? customerName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customer_id'] = customerId;
    map['customer_name'] = customerName;
    return map;
  }

}

class Comment {
  Comment({
      this.text, 
      this.showOnBill,});

  Comment.fromJson(dynamic json) {
    text = json['text'];
    showOnBill = json['showOnBill'];
  }
  String? text;
  bool? showOnBill;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['showOnBill'] = showOnBill;
    return map;
  }

}

class Table {
  Table({
      this.tableNo, 
      this.tableStatus,});

  Table.fromJson(dynamic json) {
    tableNo = json['table_no'];
    tableStatus = json['table_status'];
  }
  int? tableNo;
  String? tableStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['table_no'] = tableNo;
    map['table_status'] = tableStatus;
    return map;
  }

}

class Order {
  Order({
      this.type, 
      this.deliveryAddress,});

  Order.fromJson(dynamic json) {
    type = json['type'];
    deliveryAddress = json['deliveryAddress'];
  }
  String? type;
  String? deliveryAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['deliveryAddress'] = deliveryAddress;
    return map;
  }

}