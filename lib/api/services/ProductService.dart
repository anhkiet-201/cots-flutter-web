// import 'package:cdio_web/api/BaseApi.dart';
// import 'package:cdio_web/api/model/Product.dart';
// import 'package:cdio_web/extensions/network.dart';
//
// class ProductService {
//   static final shared = ProductService();
//   final _api = BaseApi.shared;
//
//   Future<List<Product>?> list_product_info_homepage({
// }) async {
//     final response = await _api.post(
//         path: '/dang-ky',
//         params: {
//           'PageIndex':'',
//           'PageSize':'',
//           'CategoryId':''
//         }
//     );
//     final baseResponse = response.baseResponse;
//     if (!baseResponse.result || baseResponse.data == null) return null;
//   }
// }