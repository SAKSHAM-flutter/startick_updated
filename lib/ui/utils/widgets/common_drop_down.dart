import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/drop_down_theme.dart';

class CommonDropDown<T> extends StatelessWidget {
  final List<T> items;
  final T? selected;
  final String Function(T value) getText;
  final ValueChanged<T?> onChanged;
  final double? width;
  final Color? bgColor;
  final double? height;

  const CommonDropDown({
    super.key,
    required this.items,
    this.selected,
    required this.onChanged,
    this.width,
    required this.getText,
    this.bgColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    // const border = BorderSide(color: AppColors.greyBorder);
    return Container(
      height: height ?? 30,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.greyBorder),
        // (
        //   left: border,
        //   top: border,
        //   right: border,
        //   bottom: BorderSide(color: AppColors.greyBorder, width: 4),
        // ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1C000000),
            blurRadius: 14,
            offset: Offset(0, 8),
            spreadRadius: 0,
          )
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
          isExpanded: true,
          isDense: false,
          items: items
              .map<DropdownMenuItem<T>>(
                (e) => DropdownMenuItem<T>(
                  value: e,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: e == "Organiser"
                            ? const EdgeInsets.only(bottom: 5)
                            : EdgeInsets.zero,
                        child: Text(
                          getText.call(e),
                          style: Inter.regular(AppColors.greyText).s18,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      if (e == "Organiser") const Divider(height: 1),
                    ],
                  ),
                ),
              )
              .toList(),
          selectedItemBuilder: (ctx) =>
              items.map((e) => dropdownMenuItem(getText.call(e))).toList(),
          dropdownStyleData: getDropDownStyleData(width),
          iconStyleData: iconStyleData(),
          value: selected,
          menuItemStyleData: menuItemStyleData(),
          hint: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Select",
              style: Inter.regular(AppColors.greyHint).s18,
              textAlign: TextAlign.start,
            ),
          ),
          onChanged: (value) => onChanged.call(value),
        ),
      ),
    );
  }
}
