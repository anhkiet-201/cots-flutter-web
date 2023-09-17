import 'package:cdio_web/api/BaseApi.dart';
import 'package:cdio_web/extensions/network.dart';

class PaymentService {
  static final shared = PaymentService();
  final _api = BaseApi.shared;

  Future<CreatePaymentResponse?> create_pay(
      {required int orderId, required int paymentDestinationId, required double requiredAmount}) async {
    final response = await _api.post(
        path: '/api/payment',
        body: {
          "paymentContent": "Pay for the order $orderId",
          "paymentCurrency": "VND",
          "requiredAmount": requiredAmount,
          "paymentLanguage": "VN",
          "paymentDestinationId": paymentDestinationId,
          "orderId": orderId
        }
    );
    final baseResponse = response.baseResponse;
    if(baseResponse.data == null) return null;
    return CreatePaymentResponse.fromJson(baseResponse.data!);
  }
}

class CreatePaymentResponse {
  int? paymentId;
  String? paymentUrl;

  CreatePaymentResponse({this.paymentId, this.paymentUrl});

  CreatePaymentResponse.fromJson(Map<String, dynamic> json) {
    paymentId = json['paymentId'];
    paymentUrl = json['paymentUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paymentId'] = paymentId;
    data['paymentUrl'] = paymentUrl;
    return data;
  }
}
