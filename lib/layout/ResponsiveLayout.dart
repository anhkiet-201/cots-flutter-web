import 'package:flutter/material.dart';

typedef ResponseWidgetBuilder = Widget Function(bool);

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.builder
  });
  final ResponseWidgetBuilder builder;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return builder(MediaQuery.of(context).size.width <= 600);
      },
    );
  }
}
