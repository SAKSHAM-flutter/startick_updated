import 'package:flutter/material.dart';
import 'package:startick/data/remote/model/event_dto.dart';
import 'package:startick/ui/screens/event_detail/event_detail.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/base_class/navigation.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class EventOptions extends StatelessWidget {
  final EventDto event;

  const EventOptions({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            optionView(context, "assets/guest_list.png", "Guest List", 0),
            optionView(
                context, "assets/event_stats.png", "Event Statistics", 1),
            optionView(context, "assets/in_out.png", "In / Out count", 2),
          ],
        ),
      ),
    );
  }

  Widget optionView(
      BuildContext context, String image, String title, int index) {
    return GestureDetector(
      onTap: () {
        CustomNav.named(
            context, EventDetail.route, {"event": event, 'index': index});
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              shadowColor: const Color(0xFFDAE5ED),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(14.0),
                child: CustomImage(
                  source: image,
                  height: 35,
                  width: 35,
                ),
              ),
            ),
          ),
          Text(
            title,
            style: Inter.medium(AppColors.greylight).s13,
          )
        ],
      ),
    );
  }
}
