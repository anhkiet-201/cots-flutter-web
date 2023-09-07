import 'package:cdio_web/extensions/router_extension.dart';
import 'package:cdio_web/pages/home/home.dart';
import 'package:cdio_web/pages/not-found/not-found.dart';
import 'package:cdio_web/pages/product/product.dart';
import 'package:flutter/material.dart';

MaterialPageRoute routing(RouteSettings settings) {
  final path = Uri.parse(settings.name ?? '');
  final name = path.path;
  final route = <String, Widget>{
    '/' : const HomePage(),
    '/product' : const Product()
  };
  final target = route[name];
  if(target == null) settings == const RouteSettings(name: '/not-found');
  return (target ?? const NotFound()).route(settings);
}