import 'package:cdio_web/api/model/User.dart';
import 'package:cdio_web/extensions/router_extension.dart';
import 'package:cdio_web/layout/ResponsiveLayout.dart';
import 'package:cdio_web/route.dart';
import 'package:cdio_web/utils/local_storage_service.dart';
import 'package:cdio_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDelegate extends StatelessWidget {
  const AppDelegate(this.app, {super.key});
  final App app;
  @override
  Widget build(BuildContext appContext) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => app,
        ),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) {
          return routing(settings, context);
        },
      )
    );
  }
}

class App with ChangeNotifier {
  final _service = LocalStorageService.shared;
  User? _user;

  User? get user => _user;

  set user(User? value) {
    _user = value;
    if(value != null) {
      _service.saveObject(key: LocalStorageKey.userKey, object: value);
    } else {
      _service.drop(key: LocalStorageKey.userKey);
    }
    notifyListeners();
  }

  Future<void> initApp() async {
    LocalStorageService.jwt = await _service.getValue(LocalStorageKey.jwtKey);
    user = await _service.getObject(key: LocalStorageKey.userKey, type: User.new);
    printDebug(label: 'Init app with user', user?.toJson());
  }
}
