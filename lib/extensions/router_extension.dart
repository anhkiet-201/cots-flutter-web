import 'package:flutter/material.dart';

extension Router on Widget {
  MaterialPageRoute route([RouteSettings? settings]) =>
      MaterialPageRoute(builder: (_) => this, settings: settings);
}

extension Push on BuildContext {
  push(String name, [Map<String, dynamic>? params, Object? arguments]) {
    final paramsList = <String>[];
    params?.forEach((key, value) {
      paramsList.add('$key=$value');
    });
    Navigator.maybeOf(this)?.pushNamed(
        '$name${paramsList.isEmpty ? '' : '?${paramsList.join('&')}'}',
        arguments: arguments);
  }

  T? getArguments<T>() {
    return ModalRoute.of(this)?.settings.arguments as T?;
  }
}
