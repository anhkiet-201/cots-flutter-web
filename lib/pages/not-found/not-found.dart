import 'package:cdio_web/layout/Layout.dart';
import 'package:cdio_web/utils/utils.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout.single(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                '404',
                style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
              ),
              SelectableText(
                'Not found!',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w200),
              )
            ],
          ),
        ),
      ),
    );
  }
}
