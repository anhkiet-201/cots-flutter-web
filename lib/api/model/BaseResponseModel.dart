import 'package:cdio_web/api/model/User.dart';

abstract class BaseResponse {
  BaseResponse fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}

abstract mixin class BaseData {
  BaseData fromJsonBase(Map<String, dynamic> json);
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

class PageableResponseModel extends BaseResponse {
  int totalPage = 0;
  late bool result;
  String? message;
  late List<Map<String, dynamic>> data;


  PageableResponseModel(this.totalPage, this.result, this.message, this.data);

  @override
  PageableResponseModel.fromJson(Map<String, dynamic> json) {
    totalPage = json['totalPage'] ?? 0;
    result = json['result'] ?? false;
    message = json['message'];
    if (json['data'] != null) {
      data = <Map<String, dynamic>>[];
      json['data'].forEach((v) {
        data.add(v);
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalPage'] = totalPage;
    data['result'] = result;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }

  @override
  PageableResponseModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return PageableResponseModel.fromJson(json);
  }

  Pageable<T> to<T extends BaseData>({required T Function() type}) {
    return Pageable<T>(
      totalPage: totalPage,
      items: data.map((e) => type().fromJsonBase(e) as T).toList()
    );
  }
}

class Pageable<T> {
  late int totalPage;
  late List<T> items;

  Pageable({required this.totalPage, required this.items});
  Pageable.empty() {
    totalPage = 0;
    items = [];
  }
}