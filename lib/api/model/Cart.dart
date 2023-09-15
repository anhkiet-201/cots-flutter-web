import 'package:cdio_web/api/model/BaseResponseModel.dart';

class Cart with BaseData {
  int? id;
  int? productId;
  String? name;
  double? price;
  int? quantity;

  Cart({this.id, this.productId, this.name, this.price, this.quantity});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productId'] = productId;
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }

  @override
  Cart fromJsonBase(Map<String, dynamic> json) {
    // TODO: implement fromJsonBase
    return Cart.fromJson(json);
  }
}
