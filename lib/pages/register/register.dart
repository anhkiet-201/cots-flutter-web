import 'package:cdio_web/components/button/button.dart';
import 'package:cdio_web/components/button/clickable.dart';
import 'package:cdio_web/components/space.dart';
import 'package:cdio_web/components/text_field/CustomTextField.dart';
import 'package:cdio_web/components/text_field/EmailField.dart';
import 'package:cdio_web/components/text_field/PasswordField.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                'Register',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                ),
              ),
              SpacerV(),
              const CustomTextField(
                hintText: 'User name',
                prefixIcon: Icon(Iconsax.profile_2user),
              ),
              const EmailField(),
              const PasswordField(),
              SpacerV(),
              FillButton(child: const Text('Register'), onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
