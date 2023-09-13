import 'dart:async';
import 'dart:convert';

import 'package:cdio_web/api/model/ErrorResponse.dart';
import 'package:cdio_web/utils/local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BaseApi {
  static final shared = BaseApi();
  final Map<String, String> _headers = {'Content-Type': 'application/json'};

  BaseApi();

  final String _baseUrl =
      'http://18.141.219.165';

  Future<Map<String, dynamic>> get(
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
          ErrorResponse(response.statusCode, response.reasonPhrase, _utf8JsonDecode(response.bodyBytes)['errors']));
    }
    return _utf8JsonDecode(response.bodyBytes);
  }

  Future<Map<String, dynamic>> post({required String path, Object? body, Object? rawBody, Map<String, dynamic>? params, Map<String, String>? header}) async {
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
          ErrorResponse(response.statusCode, response.reasonPhrase, _utf8JsonDecode(response.bodyBytes)['errors']));
    }
    return _utf8JsonDecode(response.bodyBytes);
  }

  Future<Map<String, dynamic>> put({required String path, Object? body, Object? rawBody, Map<String, dynamic>? params, Map<String, String>? header}) async {
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
          ErrorResponse(response.statusCode, response.reasonPhrase, _utf8JsonDecode(response.bodyBytes)['errors']));
    }
    return _utf8JsonDecode(response.bodyBytes);
  }

  Future<Map<String, dynamic>> delete({required String path, Object? body, Object? rawBody, Map<String, dynamic>? params, Map<String, String>? header}) async {
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
          ErrorResponse(response.statusCode, response.reasonPhrase, _utf8JsonDecode(response.bodyBytes)['errors']));
    }
    return _utf8JsonDecode(response.bodyBytes);
  }

  Map<String, dynamic> _utf8JsonDecode(Uint8List value) => jsonDecode(utf8.decode(value));

  String _paramsConvert(Map<String, dynamic>? params) {
    final paramsList = <String>[];
    params?.forEach((key, value) {
      paramsList.add('$key=$value');
    });
    return paramsList.isEmpty ? '' : '?${paramsList.join('&')}';
  }
}
