import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/components/text_field/CustomTextField.dart';
import 'package:cdio_web/components/text_field/EmailField.dart';
import 'package:cdio_web/components/text_field/PasswordField.dart';
import 'package:cdio_web/pages/register/provide/RegisterProvide.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
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
                'Register',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                ),
              ),
              SpacerV(),
              CustomTextField(
                controller: _nameController,
                hintText: 'User name',
                prefixIcon: const Icon(Iconsax.profile_2user),
              ),
              EmailField(
                controller: _emailController,
              ),
              PasswordField(
                controller: _passwordController,
              ),
              SpacerV(),
              _registerButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerButton() {
    final provide = context.watch<RegisterProvide>();
    if (provide.isLoading) {
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
          onTap: () async {});
    }
    return FillButton(
        child: const Text('Register'),
        onTap: () {
          context.read<RegisterProvide>().register(
              email: _emailController.text, 
              password: _passwordController.text,
              userName: _nameController.text
              );
        });
  }
}
