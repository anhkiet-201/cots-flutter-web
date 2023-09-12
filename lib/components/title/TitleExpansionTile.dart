import 'package:cdio_web/components/space.dart';
import 'package:flutter/material.dart';

Widget TitleExpansionTile({required int number, required String label}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16)
        ),
        child: Center(
          child: Text(
            '$number',
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
      ),
      SpacerH(),
      Text(
        label,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
      )
    ],
  );
}
