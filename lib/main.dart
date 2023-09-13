import 'package:cdio_web/app.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  final app = App();
  await app.initApp();
  runApp(AppDelegate(app));
}
