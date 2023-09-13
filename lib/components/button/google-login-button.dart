import 'package:cdio_web/api/services/AuthService.dart';
import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/components/image/BaseImage.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:flutter/material.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FillButton(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpacerH(10),
            const BaseImage(
              'http://pngimg.com/uploads/google/google_PNG19635.png',
              width: 24,
              height: 24,
            ),
            const Text(
              'LOGIN WITH GOOGLE'
            )
          ],
        ),
      ),
      onTap: () {
        AuthService.shared.google_login()
            .then((value) {
          if(value == null) return;
          context.app.user = value;
          Navigator.popUntil(context, (p){
            return p.settings.name == '/';
          });
        }).onError((error, stackTrace) {
          debugPrintStack(label: 'Login error', stackTrace: stackTrace);
        });
      }
    );
  }
}

