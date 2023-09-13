import 'package:cdio_web/api/BaseApi.dart';
import 'package:cdio_web/api/model/BaseResponseModel.dart';
import 'package:cdio_web/api/model/User.dart';
import 'package:cdio_web/extensions/network.dart';
import 'package:cdio_web/utils/local_storage_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final shared = AuthService();
  final _api = BaseApi.shared;
  final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  Future<BaseResponseModel> dang_ky(
      {required String name,
      required String email,
      required String password}) async {

    final result = await _api.post(
        path: '/dang-ky',
        body: {"name": name, "email": email, "password": password});
    return BaseResponseModel.fromJson(result);
  }

  Future<User?> dang_nhap(
      {required String email, required String password}) async {
    final response = await _api.post(
        path: '/dang-nhap', body: {"userName": email, "password": password});
    final baseResponse = response.baseResponse;
    if(!baseResponse.result || baseResponse.data == null) return null;
    LocalStorageService.jwt = response['token'];
    LocalStorageService.shared.saveValue(key: LocalStorageKey.jwtKey, value: LocalStorageService.jwt);
    return User.fromJson(baseResponse.data!);
  }

  Future<void> dang_xuat() async {
    LocalStorageService.jwt = null;
    await LocalStorageService.shared.drop(key: LocalStorageKey.jwtKey);
  }

  // Future<BaseResponseModel> google_login() async {
  //   final googleAcc = await _googleSignIn.signIn();
  //
  //   // final result = await _api.post(path: '/google-login', body: {"token": token});
  // }
}
