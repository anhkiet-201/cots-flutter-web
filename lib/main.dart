import 'package:cdio_web/app.dart';
import 'package:cdio_web/utils/local_storage_service.dart';
import 'package:flutter/material.dart';

void main() async {
  await LocalStorageService.initJwt();
  runApp(const AppDelegate());
}
