import 'package:cdio_web/api/BaseApi.dart';
import 'package:cdio_web/api/model/Category.dart';
import 'package:cdio_web/extensions/network.dart';

class CategoryService {
  static final shared = CategoryService();
  final _api = BaseApi.shared;

  Future<List<Category>> get_all() async {
    final response =  await _api.get(
      path: '/list-categories'
    );
    final baseResponse = response.pageableResponse;
    return baseResponse.data.map((e) => Category.fromJson(e)).toList();
  }
}