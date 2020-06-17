import 'dart:async';

import 'package:flutter/services.dart';

class PlatformOriginDialog {
  static const MethodChannel _channel =
      const MethodChannel('platform_origin_dialog');

  static Future<String> showDialog(String title, String message) async {
    final String result = await _channel.invokeMethod(
      'show_dialog',
      <String, dynamic>{
        'title': title,
        'message': message,
      });
    return result;
  }
}