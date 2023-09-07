import 'dart:convert';

import 'package:cdio_web/utils/security_storage.dart';

class LocalStorageService {
  static final shared = LocalStorageService();
  final _securityStorage = SecurityStorage.shared;

  static String? jwt;
  static Future initJwt() async {
    jwt = await shared.getValue(LocalStorageKey.jwtKey);
  }

  Future<String?> getValue(LocalStorageKey key) async {
    final result = await _securityStorage.get(key: key.value);
    return result;
  }

  Future<void> saveValue({required LocalStorageKey key, required String? value}) async {
    await _securityStorage.save(key: key.value, value: value);
  }

  Future<void> saveObject<T extends StorageObject> ({required LocalStorageKey key, required T? object}) async {
    final json = jsonEncode(object?.toJson() ?? {});
    await _securityStorage.save(key: key.value, value: json);
  }

  Future<T?> getObject<T extends StorageObject>({required LocalStorageKey key, required T Function() type}) async {
    final result = await _securityStorage.get(key: key.value);
    if(result == null) return null;
    final json = jsonDecode(result);
    if((json as Map<String, dynamic>).isEmpty) return null;
    final object = type().fromJsonStorage(json) as T;
    return object;
  }
}

enum LocalStorageKey{
  jwtKey('jwt_key');
  final String value;
  const LocalStorageKey(this.value);
}

abstract class StorageObject {
  Map<String, dynamic> toJson();
  StorageObject fromJsonStorage(Map<String, dynamic> json);
}