import 'package:cdio_web/api/services/AuthService.dart';
import 'package:cdio_web/app.dart';
import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/components/button/clickable.dart';
import 'package:cdio_web/components/button/google-login-button.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/components/text_field/EmailField.dart';
import 'package:cdio_web/components/text_field/PasswordField.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:cdio_web/pages/login/provider/LoginProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SpacerV(),
              EmailField(
                controller: _emailController,
              ),
              PasswordField(
                controller: _passwordController,
              ),
              _loginButton(),
              SpacerV(),
              const Row(
                children: [
                  Spacer(),
                  ClickAble(
                      child: Text(
                    'Forget password?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
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
                      child: const Text(
                        'Register now.',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      onClick: () {
                        context.push('/register');
                      })
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

extension on _LoginState {
  Widget _loginButton() {
    final provide = context.watch<LoginProvider>();
    if(provide.isLoading){
      return FillButton(
          child: const SizedBox(
            width: 40,
            height: 40,
            child: Center(
              child: SizedBox(
                height: 12,
                width: 12,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          onTap: () async {
          });
    }
    return FillButton(
        child: const Text('Login'),
        onTap: () {
          context.read<LoginProvider>().login(
            email: _emailController.text,
            password: _passwordController.text
          );
        });
  }
}
