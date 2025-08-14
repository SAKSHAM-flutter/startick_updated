import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:startick/ui/themes/typography.dart';

class TitleRow extends StatelessWidget {
  final String eventName;
  final Color? color;

  const TitleRow({super.key, required this.eventName, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.only(right: 60),
        child: Row(
          children: [
            Expanded(
              child: ColoredBox(
                color: Colors.black45,
                child: AutoSizeText(
                  eventName,
                  style:
                      Inter.bold(/*oppositeColor(color)??*/ Colors.white).s20,
                  maxLines: 1,
                  maxFontSize: 20,
                  minFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Container(
            //   width: 35,
            //   height: 35,
            //   margin: const EdgeInsets.only(left: 10),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(5), color: Colors.white),
            //   child: const Icon(
            //     Icons.keyboard_arrow_right,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
