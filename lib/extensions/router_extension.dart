import 'package:cdio_web/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension Router on Widget {
  MaterialPageRoute route([RouteSettings? settings]) =>
      MaterialPageRoute(builder: (_) => this, settings: settings);
  Widget provider<T extends ChangeNotifier>(T Function(BuildContext) provide) => ChangeNotifierProvider(
    create: provide,
    child: this,
  );
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

extension GlobalState on BuildContext {
  App get app => read<App>();
}
