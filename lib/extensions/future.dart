import 'package:cdio_web/api/model/BaseResponseModel.dart';

extension HandlingValue on Future {
  Future<T> onValue<T extends BaseResponseModel>(
      {required Function(T) value, required T Function() type}) async {
    final result = await this;
    final object = type().fromJson(result) as T;
    return object;
  }
}
