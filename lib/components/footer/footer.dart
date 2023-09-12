import 'package:cdio_web/components/button/clickable.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      height: 300,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClickAble(
                  child: const Text(
                    'Pet shop',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  ),
                  onClick: () {
                    context.push('/');
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }
}
