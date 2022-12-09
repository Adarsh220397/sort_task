import 'package:flutter/material.dart';

class CommonUtils {
  /// Singleton instance
  CommonUtils._internal();

  static CommonUtils instance = CommonUtils._internal();
  showSnackBar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(text),
      ),
    );
  }
}
