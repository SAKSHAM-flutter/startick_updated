import 'package:flutter/material.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class BackWidget extends StatelessWidget {
  final Color color;
  final VoidCallback? onClick;
  final String? title;
  const BackWidget(this.color, {super.key, this.onClick, this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 15),
        child: InkWell(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImage(
                source: "assets/back_icon.png",
                height: 25,
                color: color,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 11),
                child: Text(
                  title ?? "Back",
                  style: Inter.regular(color).s16,
                ),
              )
            ],
          ),
          // const Icon(Icons.arrow_back_ios, color: Colors.white),
          onTap: () {
            if (onClick != null) {
              onClick?.call();
            } else if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
