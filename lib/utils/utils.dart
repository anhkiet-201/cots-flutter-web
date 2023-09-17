import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:window_location_href/window_location_href.dart';

Map<String, String> get parameters {
  return Uri.parse(href?.replaceFirst('/#', '') ?? '').queryParameters;
}

void printDebug(Object? object, {String? label}) {
  if(kDebugMode) {
    print('${label != null ? '$label :' : ''} $object');
  }
}

bool validateEmail(String email) {
  return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}

bool validatePassword(String password) {
  return RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$').hasMatch(password);
}

bool validatePhone(String phone) => RegExp(r'^[\+\d](\d[-.()\s]?){7,12}\d$').hasMatch(phone);

String priceFormat(double? price) => NumberFormat.currency(locale: 'vi').format(price ?? 0);