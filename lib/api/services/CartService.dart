import 'package:cdio_web/api/BaseApi.dart';
import 'package:cdio_web/extensions/future.dart';

class CartService {
  static final shared = CartService();
  final _api = BaseApi.shared;

  // Future<BaseResponse> get_cart() async {
  //   return await _api.get(
  //     path: '/cart',
  //
  //   )
  // }
}