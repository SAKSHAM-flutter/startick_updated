import 'package:flutter/material.dart';
import 'package:startick/data/remote/model/event_dto.dart';
import 'package:startick/ui/screens/event_detail/event_detail.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class EventGridView extends StatelessWidget {
  final List<EventDto> events;

  const EventGridView({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: events.length,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (ctx, position) => Container(
        height: 100,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xFFE7EFF5),
          ),
        ),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, EventDetail.route,
              arguments: {"event": events[position], "index": 0}),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: CustomImage(
                  source: events[position].image,
                  height: 90,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          events[position].name,
                          style: Inter.semiBold().s16,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          events[position].date,
                          style: Inter.regular().s12,
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Text(
                                "Min.",
                                style: Inter.regular(AppColors.greyEvent).s11,
                              ),
                              const Spacer(),
                              Text(
                                "\$${events[position].min}",
                                style: Inter.bold(AppColors.buttonColor).s14,
                              ),
                              Text(
                                "/each seat",
                                style: Inter.regular(AppColors.greyEvent).s11,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Available:",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: Inter.regular(AppColors.greyEvent).s13,
                                ),
                              ),
                              Text(
                                events[position].availableSeat,
                                style: Inter.bold(AppColors.buttonColor).s14,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
    );
  }
}
