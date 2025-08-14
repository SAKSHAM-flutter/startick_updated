import 'package:flutter/material.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class UpperWidget extends StatelessWidget {
  const UpperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.65,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage(
                source: 'assets/blue_vector.png',
                fit: BoxFit.fill,
                height: MediaQuery.sizeOf(context).height * 0.34,
              ),
              const SizedBox(height: 35),
              const CustomImage(source: 'assets/logo.png', width: 240),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: SizedBox(
                  width: 260,
                  child: Text(
                    // "Your Entry to Innovation: Fast, Secure, Seamless Scanning. Empowering Tomorrow, Innovating Today.",
                    "It has survived not only five centuries, but also the leap into electronic typesetting, remaining unchanged.",
                    style: Inter.regular().s13,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height * 0.25,
            right: 0,
            child: CustomImage(
              source: 'assets/yellow_half.png',
              color: AppColors.yellowHalf,
              height: MediaQuery.sizeOf(context).height * 0.35,
            ),
          ),
        ],
      ),
    );
  }
}
