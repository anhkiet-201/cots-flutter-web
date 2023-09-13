import 'package:cdio_web/utils/local_storage_service.dart';

class UserResponse {
  String? token;
  String? refreshToken;
  User? data;
  bool? result;
  String? message;
  List<String>? errors;

  UserResponse(
      {this.token,
        this.refreshToken,
        this.data,
        this.result,
        this.message,
        this.errors});

  UserResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
    data = json['data'] != null ? User.fromJson(json['data']) : null;
    result = json['result'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = <String>[];
      json['errors'].forEach((v) {
        errors!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['result'] = result;
    data['message'] = message;
    if (errors != null) {
      data['errors'] = errors!;
    }
    return data;
  }
}
// abstract class StorageObject {
//   Map<String, dynamic> toJson();
//   StorageObject fromJsonStorage(Map<String, dynamic> json);
// }

class User with StorageObject {
  String? name;
  String? email;
  String? imageUrl;

  User({this.name, this.email, this.imageUrl});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['imageUrl'] = imageUrl;
    return data;
  }

  @override
  StorageObject fromJsonStorage(Map<String, dynamic> json) {
    // TODO: implement fromJsonStorage
    return User.fromJson(json);
  }
}
