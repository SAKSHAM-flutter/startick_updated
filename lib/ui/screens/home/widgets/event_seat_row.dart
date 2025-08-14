import 'package:flutter/material.dart';
import 'package:startick/data/remote/model/event_dto.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class EventSeatRow extends StatelessWidget {
  final EventDto eventDto;
  final Color? color;

  const EventSeatRow({super.key, required this.eventDto, this.color});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width - 215;
    bool isGreater = width * eventDto.finalPer >= width;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.only(right: 60, top: 10),
        child: Row(
          children: [
            CustomImage(
              source: 'assets/seat.png',
              height: 25,
              color: double.tryParse(eventDto.bookedSeat) == null ||
                      double.tryParse(eventDto.bookedSeat) == 0.0
                  ? Colors.white
                  : double.tryParse(eventDto.availableSeat) == 0.0
                      ? const Color(0xFF48acfc)
                      : null,
            ),
            const SizedBox(width: 5),
            Text(
              "Seats:",
              style: Inter.regular(Colors.white).s14,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 6,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.greyColor,
                    ),
                  ),
                  Container(
                    height: 6,
                    width: width * eventDto.finalPer,
                    decoration: BoxDecoration(
                      borderRadius: isGreater
                          ? BorderRadius.circular(10)
                          : const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                      color: AppColors.buttonColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${eventDto.bookedSeat} ",
                    style: Inter.bold(Colors.white).s12,
                  ),
                  TextSpan(
                    text: "/ ${eventDto.totalSeat}",
                    style: Inter.medium(Colors.white).s12,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
