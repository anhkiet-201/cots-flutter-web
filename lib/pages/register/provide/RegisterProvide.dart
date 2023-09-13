import 'package:cdio_web/api/model/ErrorResponse.dart';
import 'package:cdio_web/api/services/AuthService.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:cdio_web/extensions/snack_bar.dart';
import 'package:cdio_web/utils/utils.dart';
import 'package:flutter/material.dart';

class RegisterProvide with ChangeNotifier {
  final BuildContext context;
  RegisterProvide(this.context);
  final AuthService _service = AuthService.shared;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> register({
    required String email,
    required String password,
    required String userName
}) async {
    if(userName.isEmpty) {
      context.showSnackBar('User name must be not empty!',
          type: SnackBarType.error);
      return;
    }
    if(!validateEmail(email)) {
      context.showSnackBar('Please enter a valid email', type: SnackBarType.error);
      return;
    }
    if(!validatePassword(password)) {
      context.showSnackBar('''Please enter a valid password.\nMinimum 8 characters including uppercase letters, lowercase letters, special letters.
      ''', type: SnackBarType.error);
      return;
    }
    isLoading = true;
    await _service.dang_ky(email: email, password: password, name: userName)
    .onError((ErrorResponse error, stackTrace) {
      context.showSnackBar(error.error?.first ?? 'Error', type: SnackBarType.error);
      return null;
    })
    .then((value) {
      if(value == null) return;
      context.app.user = value;
      Navigator.popUntil(context, (p){
        return p.settings.name == '/';
      });
    }).whenComplete(() => isLoading = false);
  }
}