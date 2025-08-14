import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:startick/data/utils/log_tags.dart';

class NetworkConnection {
  static late StreamSubscription streamSubscription;
  static ValueNotifier<bool> isNetworkAvailable = ValueNotifier(false);

  static void networkStreaming() {
    streamSubscription = Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none ||
          event == ConnectivityResult.other) {
        isNetworkAvailable.value = false;
      } else {
        isNetworkAvailable.value = true;
      }
      log(
        "Network Changed: isNetworkOn- ${isNetworkAvailable.value} Type ${event.name}",
        name: LogTags.network,
      );
    });
  }

  static Future<void> checkInternetAgain() async {
    if (!isNetworkAvailable.value) {}
  }
}
