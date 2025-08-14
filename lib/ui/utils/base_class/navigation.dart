import 'package:flutter/cupertino.dart';

class CustomNav {
  ///pushNamedAndRemoveUntil
  static void namedAndRemoveUntil(BuildContext ctx, String route,
      [dynamic args]) {
    Navigator.pushNamedAndRemoveUntil(ctx, route, (route) => false,
        arguments: args);
  }

  ///pushNamed
  static Future<void> named(BuildContext ctx, String route,
      [dynamic args]) async {
    await Navigator.pushNamed(ctx, route, arguments: args);
  }
}
