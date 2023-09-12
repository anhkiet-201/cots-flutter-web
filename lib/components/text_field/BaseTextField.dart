import 'package:flutter/material.dart';

Widget BaseTextField({
  String? label,
  TextEditingController? controller,
  String? Function(String?)? validator
}) => TextFormField(
  validator: validator,
  controller: controller,
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
);