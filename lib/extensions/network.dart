import 'package:cdio_web/api/model/BaseResponseModel.dart';

extension Response on Map<String, dynamic> {
  BaseResponseModel get baseResponse => BaseResponseModel.fromJson(this);
  PageableResponseModel get pageableResponse => PageableResponseModel.fromJson(this);
}