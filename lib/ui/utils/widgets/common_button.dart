import 'package:flutter/material.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';

class CommonButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback? onClick;
  final double height;
  final double? width;
  final Color textColor;
  final Color? buttonColor;

  const CommonButton(
      {super.key,
      this.text,
      this.child,
      this.height = 50,
      this.textColor = Colors.white,
      this.buttonColor = AppColors.buttonColor,
      this.onClick,
      this.width});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onClick?.call(),
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(0),
        backgroundColor: WidgetStatePropertyAll(buttonColor),
        fixedSize: WidgetStatePropertyAll(
            Size(width ?? MediaQuery.sizeOf(context).width, height)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
      child: child ??
          Text(
            text ?? "Continue",
            style: Inter.semiBold(textColor).s20,
          ),
    );
  }
}
