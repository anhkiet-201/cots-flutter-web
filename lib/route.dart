import 'package:cdio_web/extensions/router_extension.dart';
import 'package:cdio_web/pages/cart/cart.dart';
import 'package:cdio_web/pages/check-out/check-out.dart';
import 'package:cdio_web/pages/home/home.dart';
import 'package:cdio_web/pages/login/login.dart';
import 'package:cdio_web/pages/login/provider/LoginProvider.dart';
import 'package:cdio_web/pages/not-found/not-found.dart';
import 'package:cdio_web/pages/order/order.dart';
import 'package:cdio_web/pages/product/product.dart';
import 'package:cdio_web/pages/register/provide/RegisterProvide.dart';
import 'package:cdio_web/pages/register/register.dart';
import 'package:flutter/material.dart';

MaterialPageRoute routing(RouteSettings settings, BuildContext context) {
  var routeSettings = settings;
  final route = <String, Widget>{
    '/' : const HomePage(),
    '/product' : const Product(),
    '/login' : const Login().provider(LoginProvider.new),
    '/register' : const Register().provider(RegisterProvide.new),
    '/cart' : const Cart(),
    '/check-out': const CheckOut(),
    '/order': const Order()
  };
  if(context.app.user != null) {
    switch(routeSettings.name ?? '') {
      case '/register':
      case '/login': routeSettings = const RouteSettings(name: '/');
    }
  }
  final path = Uri.parse(routeSettings.name ?? '');
  final name = path.path;
  final target = route[name];
  if(target == null) settings = const RouteSettings(name: '/not-found');
  return (target ?? const NotFound()).route(settings);
}