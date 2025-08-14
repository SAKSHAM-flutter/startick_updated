import 'package:flutter/material.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/utils/colors_helpers.dart';

class Themes {
  static ThemeData themeData = ThemeData(
    primarySwatch: createMaterialColor(AppColors.buttonColor),
    splashColor: Colors.white,
    highlightColor: Colors.white,
    hoverColor: Colors.white,
    cardColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: AppColors.buttonColor,
      secondary: AppColors.buttonColor.withOpacity(0.4),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Poppins',
  );
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
