import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:startick/data/remote/model/event_states_dto.dart';
import 'package:startick/ui/screens/event_detail/event_detail_viewmodel.dart';
import 'package:startick/ui/screens/event_detail/widgets/blue_container.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/custom_extension.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class EventDataView extends StatelessWidget {
  final EventStatesDto? statesDto;

  const EventDataView({super.key, required this.statesDto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: recordWidget("Booked", statesDto?.todayBooked ?? "0")),
          const SizedBox(width: 10),
          Selector<EventDetailModel, DateTime>(
            selector: (ctx, provider) => provider.dateTime,
            builder: (context, dateTime, child) {
              return Expanded(
                child: Stack(
                  children: [
                    const SizedBox(height: 120),
                    Positioned(
                      top: 15,
                      bottom: 15,
                      left: 0,
                      right: 0,
                      child: recordWidget(
                        "Revenue",
                        "\$${statesDto?.todayRevenue ?? "0"}",
                        'assets/revenue.png',
                      ),
                    ),
                    if (dateTime.toDDMMYYYY() == DateTime.now().toDDMMYYYY())
                      const Positioned(
                        right: 0,
                        child: BlueContainer(text: 'Today'),
                      )
                  ],
                ),
              );
            },
          ),
          const SizedBox(width: 10),
          Expanded(
              child:
                  recordWidget("Total Booked", statesDto?.totalBooked ?? "0")),
        ],
      ),
    );
  }

  Widget recordWidget(String title, String value, [String? image]) {
    return Container(
      height: 90,
      width: 400,
      decoration: BoxDecoration(
        color:
            image == null ? const Color(0xFFF8F8F8) : const Color(0xFFFFE7FC),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (image != null)
            Align(
              alignment: Alignment.bottomLeft,
              child: CustomImage(
                source: image,
                height: 65,
                color: AppColors.buttonColor,
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: Inter.semiBold(AppColors.buttonColor).s18,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: Inter.regular(AppColors.color1B).s14,
              )
            ],
          ),
        ],
      ),
    );
  }
}
