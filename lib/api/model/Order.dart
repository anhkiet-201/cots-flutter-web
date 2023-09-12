class Order {
  int? id;
  String? orderDate;
  String? shipName;
  String? shipAddress;
  String? shipEmail;
  String? shipPhoneNumber;
  int? totalPrice;

  Order(
      {this.id,
        this.orderDate,
        this.shipName,
        this.shipAddress,
        this.shipEmail,
        this.shipPhoneNumber,
        this.totalPrice});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderDate = json['orderDate'];
    shipName = json['shipName'];
    shipAddress = json['shipAddress'];
    shipEmail = json['shipEmail'];
    shipPhoneNumber = json['shipPhoneNumber'];
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['orderDate'] = orderDate;
    data['shipName'] = shipName;
    data['shipAddress'] = shipAddress;
    data['shipEmail'] = shipEmail;
    data['shipPhoneNumber'] = shipPhoneNumber;
    data['totalPrice'] = totalPrice;
    return data;
  }
}
