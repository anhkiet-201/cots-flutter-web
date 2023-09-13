import 'package:cdio_web/api/model/User.dart';
import 'package:cdio_web/api/services/AuthService.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:cdio_web/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier {
  final BuildContext context;
  LoginProvider(this.context);
  final AuthService _service = AuthService.shared;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password
}) async {
    if(!validateEmail(email)) {
      print('inValidateEmail');
      return;
    }
    if(!validatePassword(password)) {
      print('inValidateEmail');
      return;
    }
    isLoading = true;
    await _service.dang_nhap(email: email, password: password)
    .then((value) {
      if(value == null) return;
      context.app.user = value;
      Navigator.popUntil(context, (p){
        return p.settings.name == '/';
      });
    }).onError((error, stackTrace) {
      debugPrintStack(label: 'Login error', stackTrace: stackTrace);
    }).whenComplete(() => isLoading = false);
  }
}