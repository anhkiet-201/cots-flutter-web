import 'dart:async';
import 'dart:convert';

import 'package:cdio_web/api/model/ErrorResponse.dart';
import 'package:cdio_web/utils/local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

typedef BaseResponse = Map<String, dynamic>;
class BaseApi {
  static final shared = BaseApi();
  final Map<String, String> _headers = {'Content-Type': 'application/json'};

  BaseApi();

  final String _baseUrl =
      'http://localhost:8080';

  Future<dynamic> get(
      {required String path, Map<String, dynamic>? params, Map<String, String>? header}) async {
    final jwt = LocalStorageService.jwt;
    if (jwt != null) {
      _headers.addEntries([MapEntry('Authorization', jwt)]);
    }
    if(header != null) {
      _headers.addAll(header);
    }
    final response = await http.get(
        Uri.parse('$_baseUrl$path${_paramsConvert(params)}'),
        headers: _headers);
    if (response.statusCode >= 400) {
      throw Exception(
          ErrorResponse(response.statusCode, response.reasonPhrase));
    }
    return _utf8JsonDecode(response.bodyBytes);
  }

  Future<dynamic> post({required String path, Object? body, Object? rawBody, Map<String, dynamic>? params, Map<String, String>? header}) async {
    final jwt = LocalStorageService.jwt;
    if (jwt != null) {
      _headers.addEntries([MapEntry('Authorization', jwt)]);
    }
    if(header != null) {
      _headers.addAll(header);
    }
    final response = await http.post(
        Uri.parse('$_baseUrl$path${_paramsConvert(params)}'),
        body: rawBody ?? (body != null ? jsonEncode(body) : body), headers: _headers);
    if (response.statusCode >= 400) {
      throw Exception(
          ErrorResponse(response.statusCode, response.reasonPhrase));
    }
    return _utf8JsonDecode(response.bodyBytes);
  }

  Future<dynamic> put({required String path, Object? body, Object? rawBody, Map<String, dynamic>? params, Map<String, String>? header}) async {
    final jwt = LocalStorageService.jwt;
    if (jwt != null) {
      _headers.addEntries([MapEntry('Authorization', jwt)]);
    }
    if(header != null) {
      _headers.addAll(header);
    }
    final response = await http.put(
        Uri.parse('$_baseUrl$path${_paramsConvert(params)}'),
        body: rawBody ?? (body != null ? jsonEncode(body) : body), headers: _headers);
    if (response.statusCode >= 400) {
      throw Exception(
          ErrorResponse(response.statusCode, response.reasonPhrase));
    }
    return _utf8JsonDecode(response.bodyBytes);
  }

  Future<dynamic> delete({required String path, Object? body, Object? rawBody, Map<String, dynamic>? params, Map<String, String>? header}) async {
    final jwt = LocalStorageService.jwt;
    if (jwt != null) {
      _headers.addEntries([MapEntry('Authorization', jwt)]);
    }
    if(header != null) {
      _headers.addAll(header);
    }
    final response = await http.delete(
        Uri.parse('$_baseUrl$path${_paramsConvert(params)}'),
        body: rawBody ?? (body != null ? jsonEncode(body) : body), headers: _headers);
    if (response.statusCode >= 400) {
      throw Exception(
          ErrorResponse(response.statusCode, response.reasonPhrase));
    }
    return _utf8JsonDecode(response.bodyBytes);
  }

  String _utf8JsonDecode(Uint8List value) => jsonDecode(utf8.decode(value));

  String _paramsConvert(Map<String, dynamic>? params) {
    final paramsList = <String>[];
    params?.forEach((key, value) {
      paramsList.add('$key=$value');
    });
    return paramsList.isEmpty ? '' : '?${paramsList.join('&')}';
  }
}
