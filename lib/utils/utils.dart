import 'package:flutter/foundation.dart';
import 'package:window_location_href/window_location_href.dart';

Map<String, String> get parameters {
  return Uri.parse(href?.replaceFirst('/#', '') ?? '').queryParameters;
}

void printDebug(Object? object) {
  if(kDebugMode) {
    print(object);
  }
}