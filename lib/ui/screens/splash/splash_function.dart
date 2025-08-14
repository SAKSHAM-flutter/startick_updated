import 'dart:async';

import 'package:flutter/cupertino.dart';

class SplashFunction {
  static ValueNotifier<int> loading = ValueNotifier(10);

  static void startLoading() async {
    while (loading.value > 1) {
      await Future.delayed(const Duration(milliseconds: 200), () {
        loading.value = loading.value - 1;
      });
    }
  }
}
