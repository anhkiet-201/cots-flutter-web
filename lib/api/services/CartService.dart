import 'package:cdio_web/api/BaseApi.dart';
import 'package:cdio_web/api/model/Cart.dart';
import 'package:cdio_web/extensions/network.dart';

class CartService {
  static final shared = CartService();
  final _api = BaseApi.shared;

  // Future<List<Cart>> get_carts() async {
  //   final response = await _api.get(
  //     path: 'api/Cart',
  //   );
  //   var baseResponse = response.baseResponse;
  //   return response.map((key, value) => )
  // }

  Future<bool> add_to_cart(int id) async {
    await _api.post(path: '/api/cart', body: id);
    return true;
  }

  Future<List<Cart>> get_carts() async {
    final response = await _api.get(
      path: '/api/cart',
    );
    final pageResponse = response.pageableResponse;
    return pageResponse.data.map((e) => Cart.fromJson(e)).toList();
  }

  Future<bool> remove(int id) async {
    await _api.delete(path: '/api/cart/$id');
    return true;
  }

  Future<bool> update(int id, int quantity) async {
    await _api
        .put(path: '/api/cart', params: {'id': id, 'quantity': quantity});
    return true;
  }

// Future<BaseResponse> update_cart(
//     {required int id, required int quantity}) async {
//   return await _api
//       .put(path: '/cart', params: {'id': id, 'quantity': quantity});
// }
//
// Future<BaseResponse> clear_cart(
//     {required int id, required int quantity}) async {
//   return await _api
//       .delete(path: '/cart'
//   );
// }
//
// Future<BaseResponse> remove_cart(int id) async {
//   return await _api
//       .delete(path: '/cart',
//     params: {
//         'id': id
//     }
//   );
// }
}
