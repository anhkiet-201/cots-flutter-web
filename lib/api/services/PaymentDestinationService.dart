import 'package:cdio_web/api/BaseApi.dart';
import 'package:cdio_web/api/model/PaymentDestination.dart';
import 'package:cdio_web/extensions/network.dart';

class PaymentDestinationService {
  static final shared = PaymentDestinationService();
  final _api = BaseApi.shared;

  Future<List<PaymentDestination>> get_all() async {
    final response = await _api.get(
      path: '/api/PaymentDestination'
    );
    final pageResponse = response.pageableResponse;
    return pageResponse.data.map((e) => PaymentDestination.fromJson(e)).toList();
  }
}