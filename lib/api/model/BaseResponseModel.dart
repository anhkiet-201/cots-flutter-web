import 'package:cdio_web/api/model/User.dart';

abstract class BaseResponse {
  BaseResponse fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}

class BaseResponseModel extends BaseResponse {
  late bool result;
  String? message;
  Map<String, dynamic>? data;

  BaseResponseModel({this.result = false, this.message, this.data});

  BaseResponseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] ?? false;
    message = json['message'];
    data = json['data'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data;
    }
    return data;
  }

  @override
  BaseResponse fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return BaseResponseModel.fromJson(json);
  }
}

// class BaseAuthResponseModel extends BaseResponse {
//   String? token;
//   String? refreshToken;
//   User? data;
//   bool? result;
//   String? message;
//   // List<Null>? errors;
//
//   BaseAuthResponseModel(
//       {this.token,
//         this.refreshToken,
//         this.data,
//         this.result,
//         this.message});
//
//   BaseAuthResponseModel.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     refreshToken = json['refreshToken'];
//     data = json['data'] != null ? User.fromJson(json['data']) : null;
//     result = json['result'];
//     message = json['message'];
//     // if (json['errors'] != null) {
//     //   errors = <Null>[];
//     //   json['errors'].forEach((v) {
//     //     errors!.add(Null.fromJson(v));
//     //   });
//     // }
//   }
//
//   @override
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['token'] = token;
//     data['refreshToken'] = refreshToken;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['result'] = result;
//     data['message'] = message;
//     // if (this.errors != null) {
//     //   data['errors'] = this.errors!.map((v) => v.toJson()).toList();
//     // }
//     return data;
//   }
//
//   @override
//   BaseResponse fromJson(Map<String, dynamic> json) {
//     // TODO: implement fromJson
//     return BaseAuthResponseModel.fromJson(json);
//   }
// }