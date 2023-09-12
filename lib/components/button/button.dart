import 'package:flutter/material.dart';

Widget Button({required Widget child, required Function() onTap}) =>
    OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minimumSize: const Size(50, 50),
        foregroundColor: Colors.black
      ),
      child: child,
    );

Widget FillButton(
        {required Widget child, required Function() onTap}) =>
    ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          backgroundColor: Colors.black,
          elevation: 0,
          minimumSize: const Size(50, 57),
          foregroundColor: Colors.white
        ),
        child: child);
