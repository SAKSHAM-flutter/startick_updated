import 'package:flutter/material.dart';
import 'package:startick/ui/screens/splash/widgets/loading_widget.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class LowerWidget extends StatelessWidget {
  const LowerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.sizeOf(context).width * 0.25;

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.35,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          const Positioned(
            bottom: 10,
            top: 0,
            child: CustomImage(source: 'assets/ticket.png', fit: BoxFit.fill),
          ),
          Positioned(
            right: MediaQuery.sizeOf(context).width * 0.2,
            left: MediaQuery.sizeOf(context).width * 0.1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                containers(
                  MediaQuery.sizeOf(context).height * 0.3,
                  containerWidth,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "LOADING . . .",
                      style: Archivo.bold().s14,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 12),
                      child: SplashLoading(),
                    ),
                    containers(
                      MediaQuery.sizeOf(context).height * 0.2,
                      containerWidth,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget containers(double height, double width) {
    const radius = Radius.circular(5);
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
        color: AppColors.buttonColor,
      ),
      width: width,
      height: height,
    );
  }
}
