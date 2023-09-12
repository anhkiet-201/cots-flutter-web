import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/components/image/BaseImage.dart';
import 'package:cdio_web/components/space.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
  ],
);
class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FillButton(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpacerH(size: 10),
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
        _googleSignIn.signIn();
      }
    );
  }
}
