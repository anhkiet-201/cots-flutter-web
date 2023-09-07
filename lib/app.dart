import 'package:cdio_web/extensions/router_extension.dart';
import 'package:cdio_web/layout/ResponsiveLayout.dart';
import 'package:cdio_web/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDelegate extends StatelessWidget {
  const AppDelegate( {super.key});
  // final App app;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: App(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) {
          return routing(settings);
        },
      ),
    );
  }
}

class App with ChangeNotifier {

}
