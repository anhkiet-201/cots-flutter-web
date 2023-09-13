import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityStorage {
  static final shared = SecurityStorage();
  final _storage = const FlutterSecureStorage();

  save({required String key, String? value}) async {
    await _storage.write(
        key: key,
        value: value,
        aOptions: _androidOptions,
        webOptions: _webOptions);
  }

  Future<String?> get({required String key}) async {
    final result = await _storage.read(key: key, aOptions: _androidOptions);
    return result;
  }

  AndroidOptions get _androidOptions => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  WebOptions get _webOptions => const WebOptions();

  WindowsOptions get _winOptions => const WindowsOptions();

  Future<void> drop({required String key}) async {
    await _storage.delete(
        key: key,
        aOptions: _androidOptions,
        webOptions: _webOptions,
        wOptions: _winOptions);
  }
}
