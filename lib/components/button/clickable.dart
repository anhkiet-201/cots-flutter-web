import 'package:flutter/material.dart';

class ClickAble extends StatelessWidget {
  const ClickAble({super.key, required this.child, this.onClick});
  final Widget child;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onClick,
        child: child,
      ),
    );
  }
}
