import 'package:cdio_web/api/BaseApi.dart';

class AuthService {
  static final shared = AuthService();
  final _api = BaseApi.shared;

  Future<BaseResponse> dang_ky(
      {required String name,
      required String email,
      required String password}) async {
    return _api.post(
        path: '/dang-ky',
        body: {"name": name, "email": email, "password": password});
  }

  Future<BaseResponse> dang_nhap(
      {required String email, required String password}) async {
    return _api.post(
        path: '/dang-nhap', body: {"userName": email, "password": password});
  }

  Future<BaseResponse> google_login({required String token}) async {
    return _api.post(path: '/google-login', body: {"token": token});
  }
}
