import 'package:flutter/material.dart';
import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/data/remote/repo/auth_repo.dart';
import 'package:startick/ui/screens/auth/login.dart';
import 'package:startick/ui/screens/home/home_screen.dart';
import 'package:startick/ui/screens/scanner_home/scanner_home.dart';
import 'package:startick/ui/screens/splash/splash_function.dart';
import 'package:startick/ui/screens/splash/widgets/lower_widget.dart';
import 'package:startick/ui/screens/splash/widgets/upper_widget.dart';
import 'package:startick/ui/screens/ticket_scanning/ticket_scan_screen.dart';
import 'package:startick/ui/utils/base_class/navigation.dart';
import 'package:startick/ui/utils/toasts.dart';

class SplashScreen extends StatefulWidget {
  static const String route = "splashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SplashFunction.startLoading();
      SplashFunction.loading.addListener(() {
        if (SplashFunction.loading.value == 1) {
          if (Prefs.logging.get()) {
            navigateToNext();
          } else {
            CustomNav.namedAndRemoveUntil(context, LoginScreen.route);
          }
        }
      });
    });
    super.initState();
  }

  void navigateToNext() {
    try {
      UserType type = AuthRepo.getUserTypeByRole(Prefs.role.get());
      switch (type) {
        case UserType.scanner:
          CustomNav.namedAndRemoveUntil(context, TicketScanScreen.route);
          break;
        case UserType.organizer:
          CustomNav.namedAndRemoveUntil(context, HomeScreen.route);
          break;
        case UserType.metherScanner:
          CustomNav.namedAndRemoveUntil(context, ScannerHome.route);
          break;
        case UserType.metherOrganizer:
          CustomNav.namedAndRemoveUntil(context, ScannerHome.route);
          break;
      }
    } catch (_) {
      errorToast("Something Went Wrong!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UpperWidget(),
            LowerWidget(),
          ],
        ),
      ),
    );
  }
}
