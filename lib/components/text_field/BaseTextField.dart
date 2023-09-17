import 'package:flutter/material.dart';

Widget BaseTextField({
  String? label,
  TextEditingController? controller,
  String? Function(String?)? validator,
  Function(String)? onChange,
  String? initValue,
  TextInputType? type
}) => TextFormField(
  validator: validator,
  controller: controller,
  keyboardType: type,
  decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
          fontSize: 14,
          color: Colors.black.withOpacity(0.5)
      ),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
              width: 0.5
          )
      ),
      focusedBorder:  const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            width: 0.5,
          )
      )
  ),
  onChanged: onChange,
  initialValue: initValue,
);