// import 'package:cdio_web/api/BaseApi.dart';
// import 'package:cdio_web/api/model/Cart.dart';
//
// class CartService {
//   static final shared = CartService();
//   final _api = BaseApi.shared;
//
//   Future<List<Cart>> get_carts() async {
//     final response = await _api.get(
//       path: '/cart',
//     );
//     return response.map((key, value) => )
//   }
//
//   Future<BaseResponse> add_to_cart(int id) async {
//     return await _api.post(path: '/cart', body: id);
//   }
//
//   Future<BaseResponse> update_cart(
//       {required int id, required int quantity}) async {
//     return await _api
//         .put(path: '/cart', params: {'id': id, 'quantity': quantity});
//   }
//
//   Future<BaseResponse> clear_cart(
//       {required int id, required int quantity}) async {
//     return await _api
//         .delete(path: '/cart'
//     );
//   }
//
//   Future<BaseResponse> remove_cart(int id) async {
//     return await _api
//         .delete(path: '/cart',
//       params: {
//           'id': id
//       }
//     );
//   }
// }
