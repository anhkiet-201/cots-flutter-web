class OrderHistory {
  int? orderId;
  String? shipName;
  String? shipAddress;
  String? shipPhoneNumber;
  int? orderStatus;
  String? paymentDate;
  String? methodPayment;
  double? totalPrice;

  OrderHistory(
      {this.orderId,
        this.shipName,
        this.shipAddress,
        this.shipPhoneNumber,
        this.orderStatus,
        this.paymentDate,
        this.methodPayment,
        this.totalPrice});

  OrderHistory.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    shipName = json['shipName'];
    shipAddress = json['shipAddress'];
    shipPhoneNumber = json['shipPhoneNumber'];
    orderStatus = json['orderStatus'];
    paymentDate = json['paymentDate'];
    methodPayment = json['methodPayment'];
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['shipName'] = shipName;
    data['shipAddress'] = shipAddress;
    data['shipPhoneNumber'] = shipPhoneNumber;
    data['orderStatus'] = orderStatus;
    data['paymentDate'] = paymentDate;
    data['methodPayment'] = methodPayment;
    data['totalPrice'] = totalPrice;
    return data;
  }
}

class OrderHistoryDetail {
  String? productName;
  String? thumbnail;
  int? productQuantity;
  double? productPrice;
  double? subtotal;

  OrderHistoryDetail(
      {this.productName,
        this.thumbnail,
        this.productQuantity,
        this.productPrice,
        this.subtotal});

  OrderHistoryDetail.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    thumbnail = json['thumbnail'];
    productQuantity = json['productQuantity'];
    productPrice = json['productPrice'];
    subtotal = json['subtotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productName'] = productName;
    data['thumbnail'] = thumbnail;
    data['productQuantity'] = productQuantity;
    data['productPrice'] = productPrice;
    data['subtotal'] = subtotal;
    return data;
  }
}

