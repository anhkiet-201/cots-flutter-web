import 'package:cdio_web/api/BaseApi.dart';
import 'package:cdio_web/api/model/Order.dart';
import 'package:cdio_web/extensions/network.dart';

class OrderService {
  static final shared = OrderService();
  final _api = BaseApi.shared;

  Future<Order?> create_order(
      {required String name,
      required String address,
      required String email,
      required String phone,
      required List<OrderRequest> list}) async {
    final listProductOrder =
        list.map((e) => {'productId': e.id, 'quantity': e.quantity}).toList();
    final response = await _api.post(path: '/api/order', body: {
      "orderDate": DateTime.now().toIso8601String(),
      "shipName": name,
      "shipAddress": address,
      "shipEmail": email,
      "shipPhoneNumber": phone,
      "listProductOrder": listProductOrder
    });
    final baseResponse = response.baseResponse;
    if(baseResponse.data == null) return null;
    return Order.fromJson(baseResponse.data!);
  }
}

class OrderRequest {
  final int id;
  final int quantity;

  OrderRequest(this.id, this.quantity);
}
