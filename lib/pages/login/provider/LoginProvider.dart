import 'package:cdio_web/api/model/User.dart';
import 'package:cdio_web/api/services/AuthService.dart';
import 'package:cdio_web/extensions/router_extension.dart';
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

  Future<void> login() async {
    isLoading = true;
    await _service.dang_nhap(email: 'igg.anhkiet1@gmail.com', password: '12345678A@a')
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