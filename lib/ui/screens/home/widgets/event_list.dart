import 'package:flutter/material.dart';
import 'package:startick/data/remote/model/event_dto.dart';
import 'package:startick/ui/screens/event_detail/event_detail.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class EventListView extends StatelessWidget {
  final List<EventDto> events;

  const EventListView({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: events.length,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      separatorBuilder: (ctx, index) => const SizedBox(height: 10),
      itemBuilder: (ctx, position) => Container(
        height: 90,
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
          child: Row(
            children: [
              CustomImage(
                source: events[position].image,
                height: 85,
                width: 85,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () => Navigator.pushNamed(context, EventDetail.route,
                        arguments: {"event": events[position], "index": 0}),
                    dense: false,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          events[position].name,
                          style: Inter.semiBold().s12,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 1),
                        Text(
                          events[position].date,
                          style: Inter.regular().s12,
                        ),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Min.",
                                style: Inter.regular(AppColors.greyEvent).s11,
                                children: [
                                  TextSpan(
                                    text: " \$${events[position].min} ",
                                    style:
                                        Inter.bold(AppColors.buttonColor).s14,
                                    children: [
                                      TextSpan(
                                        text: "/each seat",
                                        style:
                                            Inter.regular(AppColors.greyEvent)
                                                .s11,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: "Available: ",
                                  style: Inter.regular(AppColors.greyEvent).s11,
                                  children: [
                                    TextSpan(
                                      text: events[position].availableSeat,
                                      style:
                                          Inter.bold(AppColors.buttonColor).s14,
                                    ),
                                  ],
                                ),
                                maxLines: 1,
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
