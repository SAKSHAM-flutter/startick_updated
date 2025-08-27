import 'package:flutter/material.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/common_button.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

void showPopUp({
  required BuildContext context,
  required String text,
  VoidCallback? onClick,
}) {
  showGeneralDialog(
    context: context,
    barrierColor: Colors.black26,
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 800),
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(0, -0.9),
          end: const Offset(0, 0),
        ).animate(anim1),
        child: child,
      );
    },
    pageBuilder: (context, ani1, ani2) => PopScope(
      onPopInvokedWithResult: (did, result) => false,
      child: SimpleDialog(
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding: const EdgeInsets.all(50),
        backgroundColor: AppColors.greyLight,
        children: [
          const CustomImage(
              source: 'assets/right_icon.png', height: 75, width: 75),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: Inter.medium(AppColors.greyLight).s16,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          CommonButton(
            text: 'Done',
            onClick: () {
              Navigator.pop(context);
              onClick?.call();
            },
          )
        ],
      ),
    ),
  );
}
