import 'package:flutter/material.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';

class BlueContainer extends StatelessWidget {
  final String text;

  const BlueContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: text == "Today" ? AppColors.colorD4F : AppColors.buttonColor,
      ),
      child: Center(
        child: Text(
          text,
          style: Inter.bold(Colors.white).s10,
        ),
      ),
    );
  }
}
