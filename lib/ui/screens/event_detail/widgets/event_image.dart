import 'package:flutter/material.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class EventImage extends StatelessWidget {
  final String image;

  const EventImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(width: MediaQuery.sizeOf(context).width, height: height * 0.3),
        CustomImage(
          source: image,
          height: height * 0.3,
          fit: BoxFit.cover,
          width: MediaQuery.sizeOf(context).width,
        ),
        // Positioned(
        //   left: 15,a
        //   right: 15,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Container(
        //         width: 35,
        //         height: 35,
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(5),
        //             color: Colors.white),
        //         child: const Icon(
        //           Icons.keyboard_arrow_left,
        //         ),
        //       ),
        //       Container(
        //         width: 35,
        //         height: 35,
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(5),
        //             color: Colors.white),
        //         child: const Icon(
        //           Icons.keyboard_arrow_right,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
