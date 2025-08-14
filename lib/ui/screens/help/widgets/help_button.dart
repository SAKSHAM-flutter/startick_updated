import 'package:flutter/material.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/custom_extension.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpButton extends StatelessWidget {
  final String text, image, url;

  const HelpButton({
    super.key,
    required this.text,
    required this.image,
    this.url = "",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55),
      child: GestureDetector(
        onTap: () {
          if (!url.isNullOrEmpty()) {
            launchUrl(Uri.parse(url));
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            children: [
              const Spacer(flex: 2),
              CustomImage(source: image, height: 45),
              const Spacer(flex: 1),
              Expanded(
                flex: 7,
                child: Text(
                  text,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  style: Inter.semiBold(const Color(0xff183065)).s18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
