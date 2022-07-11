import 'dart:async';

import 'package:flutter/services.dart';

class PayuMobilePaymentsAndroid {
  static const MethodChannel _channel = MethodChannel('payu_mobile_payments_android');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
