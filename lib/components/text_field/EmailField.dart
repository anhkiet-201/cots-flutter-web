import 'package:flutter/material.dart';
import 'CustomTextField.dart';

class EmailField extends StatefulWidget {
  const EmailField({Key? key, this.controller, this.enable = true}) : super(key: key);
  final TextEditingController? controller;
  final bool enable;
  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  bool _visiable = false;
  bool _isValid = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      hintText: 'Email',
      enable: widget.enable,
      inputType: TextInputType.emailAddress,
      prefixIcon: const Icon(Icons.email_outlined),
      onChange: (value){
        if(value.isNotEmpty){
          _visiable = true;
          if(isValidEmail(value)){
            _isValid = true;
          }else{
            _isValid = false;
          }
        }else{
          _visiable = false;
        }
        setState(() {

        });
      },
      suffixIcon: Visibility(
        visible: _visiable,
        child: _isValid ? const Icon(Icons.check, color: Colors.green,) : const Icon(Icons.close,color: Colors.redAccent),
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

}
