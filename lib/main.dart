import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/data/remote/network_connection.dart';
import 'package:startick/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NetworkConnection.networkStreaming();
  await Prefs.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
