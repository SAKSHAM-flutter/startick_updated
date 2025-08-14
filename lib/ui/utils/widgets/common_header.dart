import 'package:flutter/material.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';

class CommonHeader extends StatelessWidget {
  final bool isBack;
  final double vertical;
  final VoidCallback? onBack;
  final Widget? action, leading;

  final String title;

  const CommonHeader({
    super.key,
    this.isBack = true,
    this.action,
    this.title = '',
    this.onBack,
    this.leading,
    this.vertical = 15,
  });

  @override
  Widget build(BuildContext context) {
    bool canBack = Navigator.canPop(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: 20),
      child: Row(
        children: [
          if (isBack && leading == null && canBack)
            GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                  onBack?.call();
                }
              },
              child: const Icon(
                Icons.arrow_back,
                size: 30,
                color: AppColors.appColor,
              ),
            ),
          leading ?? const SizedBox(width: 30),
          Expanded(
            child: Text(
              title,
              style: Inter.semiBold(AppColors.appColor).s20,
              textAlign: TextAlign.center,
            ),
          ),
          action ?? const SizedBox(width: 30),
        ],
      ),
    );
  }
}
