import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';

class CommonField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? textFormatters;
  final String? hintText, labelText;
  final Widget? suffixIcon;
  final ValueChanged<FocusNode>? onFocusChanged, onNextFocus;
  final int? maxLine;
  final bool? obscureText;
  final TextAlign textAlign;
  final TextStyle? hintStyle;

  const CommonField({
    super.key,
    required this.controller,
    this.textAlign = TextAlign.start,
    this.textInputType,
    this.textFormatters,
    this.textInputAction = TextInputAction.next,
    this.hintText,
    this.hintStyle,
    this.maxLine,
    this.labelText,
    this.focusNode,
    this.onFocusChanged,
    this.onNextFocus,
    this.suffixIcon,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    const focusSide = BorderSide(width: 1, color: AppColors.focusColor);
    const focusSide4 = BorderSide(width: 4, color: AppColors.focusColor);
    const side = BorderSide(width: 1, color: AppColors.greyBorder);
    const side4 = BorderSide(width: 4, color: AppColors.greyBorder);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.greyBorder),
    );
    final focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.focusColor),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(labelText!, style: Inter.semiBold().s16),
          const SizedBox(height: 10),
        ],
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            border: Border(
                left: (focusNode?.hasPrimaryFocus ?? false) ? focusSide : side,
                top: (focusNode?.hasPrimaryFocus ?? false) ? focusSide : side,
                right: (focusNode?.hasPrimaryFocus ?? false) ? focusSide : side,
                bottom: ((focusNode?.hasPrimaryFocus ?? false)
                    ? focusSide4
                    : side4)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1C000000),
                blurRadius: 14,
                offset: Offset(0, 8),
                spreadRadius: 0,
              )
            ],
          ),
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            onTap: () {
              if (focusNode != null) onFocusChanged?.call(focusNode!);
            },
            style: Inter.regular(AppColors.greyText).s18,
            textInputAction: textInputAction,
            onFieldSubmitted: (f) {
              if (focusNode != null) onNextFocus?.call(focusNode!);
            },
            onEditingComplete: () {
              if (focusNode != null) onNextFocus?.call(focusNode!);
            },
            cursorColor: AppColors.focusColor,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(
                  right: 15, left: 20, bottom: 10, top: 10),
              filled: true,
              hintStyle: Inter.regular(AppColors.greyHint).s18,
              fillColor: Colors.white,
              errorBorder: border,
              suffixIcon: suffixIcon,
              enabledBorder: border,
              disabledBorder: border,
              focusedErrorBorder: border,
              focusedBorder: focusBorder,
            ),
          ),
        ),
      ],
    );
  }
}
