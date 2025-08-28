import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/ui/screens/auth/auth_viewmodel.dart';
import 'package:startick/ui/screens/auth/login.dart';
import 'package:startick/ui/screens/auth/otp_screen.dart';
import 'package:startick/ui/screens/event_detail/event_detail.dart';
import 'package:startick/ui/screens/event_detail/event_detail_viewmodel.dart';
import 'package:startick/ui/screens/help/help_screen.dart';
import 'package:startick/ui/screens/home/home_screen.dart';
import 'package:startick/ui/screens/home/home_viewmodel.dart';
import 'package:startick/ui/screens/profile/profile_screen.dart';
import 'package:startick/ui/screens/profile/profile_viewmodel.dart';
import 'package:startick/ui/screens/scanner_home/scanner_home.dart';
import 'package:startick/ui/screens/scanner_home/scanner_home_viewmodel.dart';
import 'package:startick/ui/screens/scanning_history/scanning_history_model.dart';
import 'package:startick/ui/screens/splash/splash_screen.dart';
import 'package:startick/ui/screens/ticket_scanning/ticket_scan_model.dart';
import 'package:startick/ui/screens/ticket_scanning/ticket_scan_screen.dart';

class RouteHelper {
  static Map<String, WidgetBuilder> createRoutes() {
    return {
      SplashScreen.route: (_) => const SplashScreen(),
      HelpScreen.route: (_) => const HelpScreen(),
      LoginScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => AuthViewModel(),
            child: const LoginScreen(),
          ),
      OtpScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => AuthViewModel(),
            child: const OtpScreen(),
          ),
      // ForgotPassword.route: (_) => ChangeNotifierProvider(
      //       create: (_) => AuthViewModel(),
      //       child: const ForgotPassword(),
      //     ),
      HomeScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => HomeViewModel(),
            child: const HomeScreen(),
          ),
      ProfileScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => ProfileModel(),
            child: const ProfileScreen(),
          ),
      // ScannerProfile.route: (_) => ChangeNotifierProvider(
      //       create: (_) => ProfileModel(),
      //       child: const ScannerProfile(),
      //     ),
      ScannerHome.route: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => ProfileModel()),
              ChangeNotifierProvider(create: (_) => SCHomeModel()),
              ChangeNotifierProvider(create: (_) => ScanningHistoryModel()),
            ],
            child: const ScannerHome(),
          ),
      // ScanningHistory.route: (_) => ChangeNotifierProvider(
      //       create: (_) => ScanningHistoryModel(),
      //       child: const ScanningHistory(),
      //     ),
      EventDetail.route: (_) => ChangeNotifierProvider(
            create: (_) => EventDetailModel(),
            child: const EventDetail(),
          ),
      TicketScanScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => TicketScanModel(),
            child: const TicketScanScreen(),
          )
    };
  }
}
