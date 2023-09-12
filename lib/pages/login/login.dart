import 'package:cdio_web/api/model/ErrorResponse.dart';
import 'package:cdio_web/api/services/AuthService.dart';
import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/components/button/clickable.dart';
import 'package:cdio_web/components/button/google-login-button.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/components/text_field/EmailField.dart';
import 'package:cdio_web/components/text_field/PasswordField.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //final AuthService _service = AuthService.shared;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                  'Login',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                ),
              ),
              SpacerV(),
              const EmailField(),
              const PasswordField(),
              FillButton(child: const Text('Login'), onTap: () {
                // _service.google_login(token: 'dsfsd')
                //     .then((value){
                //       print(value);
                // }).onError((ErrorResponse error, stackTrace) {
                //   print(error.statusCode);
                // });
              }),
              SpacerV(),
              const Row(
                children: [
                  Spacer(),
                  ClickAble(
                      child: Text('Forget password?', style: TextStyle(fontWeight: FontWeight.bold),)
                  )
                ],
              ),
              SpacerV(),
              Row(
                children: [
                  const Text('Don\'t have account?'),
                  const SizedBox(
                    width: 5,
                  ),
                  ClickAble(
                      child: const Text('Register now.', style: TextStyle(fontWeight: FontWeight.w600),),
                    onClick: () {
                        context.push('/register');
                    }
                  )
                ],
              ),
              SpacerV(),
              const Center(child: GoogleLoginButton())
            ],
          ),
        ),
      ),
    );
  }
}
