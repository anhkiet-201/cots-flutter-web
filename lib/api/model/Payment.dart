class PaymentResponse {
  bool? result;
  String? message;
  List<Errors>? errors;
  Data? data;

  PaymentResponse({this.result, this.message, this.errors, this.data});

  PaymentResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors!.add(Errors.fromJson(v));
      });
    }
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    if (errors != null) {
      data['errors'] = errors!.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Errors {
  String? code;
  String? message;

  Errors({this.code, this.message});

  Errors.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class Data {
  int? paymentId;
  String? paymentUrl;

  Data({this.paymentId, this.paymentUrl});

  Data.fromJson(Map<String, dynamic> json) {
    paymentId = json['paymentId'];
    paymentUrl = json['paymentUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paymentId'] = paymentId;
    data['paymentUrl'] = paymentUrl;
    return data;
  }
}
