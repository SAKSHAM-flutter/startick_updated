import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startick/routes.dart';
import 'package:startick/ui/screens/splash/splash_screen.dart';
import 'package:startick/ui/themes/theme.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          initialRoute: SplashScreen.route,
          routes: RouteHelper.createRoutes(),
          debugShowCheckedModeBanner: false,
          theme: Themes.themeData,
          navigatorKey: navigatorKey,
          builder: (context, widget) {
            return ScrollConfiguration(
              behavior: const ScrollBehaviorModified(),
              child: Overlay(
                initialEntries: [
                  OverlayEntry(
                    builder: (ctx) => MediaQuery.withNoTextScaling(
                      child: widget!,
                    ),
                  )
                ],
              ),
            );
          },
          // initialRoute: SplashScreen.route,
        );
      },
    );
  }
}
