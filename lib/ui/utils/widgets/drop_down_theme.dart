import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';

DropdownStyleData getDropDownStyleData(double? width) {
  return DropdownStyleData(
    isOverButton: true,
    offset: const Offset(0, 0),
    width: width,
    padding: EdgeInsets.zero,
    direction: DropdownDirection.left,
    elevation: 4,
    scrollPadding: EdgeInsets.zero,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
    ),
    scrollbarTheme: const ScrollbarThemeData(
      trackVisibility: MaterialStatePropertyAll(false),
      thumbVisibility: MaterialStatePropertyAll(false),
      thickness: MaterialStatePropertyAll(0),
    ),
  );
}

IconStyleData iconStyleData() {
  return IconStyleData(
    iconEnabledColor: AppColors.greyText,
    iconSize: 20,
    icon: Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 20),
      child: Transform.rotate(
        angle: 4.7,
        child: const Icon(Icons.arrow_back_ios),
      ),
    ),
  );
}

MenuItemStyleData menuItemStyleData({double? height}) {
  return MenuItemStyleData(
    padding: EdgeInsets.zero,
    height: height ?? 33,
    overlayColor: WidgetStatePropertyAll(AppColors.greyText),
  );
}

DropdownMenuItem dropdownMenuItem(String e) {
  return DropdownMenuItem(
    value: e,
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        e,
        style: Inter.regular(AppColors.greyText).s18,
        maxLines: 1,
      ),
    ),
  );
}
