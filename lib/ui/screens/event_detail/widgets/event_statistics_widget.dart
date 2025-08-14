import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/data/remote/model/event_states_dto.dart';
import 'package:startick/ui/screens/event_detail/event_detail_viewmodel.dart';
import 'package:startick/ui/screens/event_detail/widgets/blue_container.dart';
import 'package:startick/ui/screens/event_detail/widgets/date_icon.dart';
import 'package:startick/ui/screens/event_detail/widgets/event_data.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/custom_extension.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';
import 'package:startick/ui/utils/widgets/loading.dart';
import 'package:tuple/tuple.dart';

class EventStatistics extends StatelessWidget {
  const EventStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    double radius = 12;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Selector<EventDetailModel, Tuple2<EventStatesDto?, bool>>(
        selector: (ctx, pro) => Tuple2(pro.eventStates, pro.statesLoad),
        builder: (context, items, child) {
          EventStatesDto? statesDto = items.item1;
          return Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(radius),
                bottomLeft: Radius.circular(radius),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 38,
                  offset: Offset(0, -2),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Stack(
              children: [
                if (items.item2)
                  const SizedBox(
                    height: 310,
                    child: Center(
                      child: LoadingIndicator(),
                    ),
                  ),
                if (!items.item2)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const DateIcons(isNext: false),
                            Selector<EventDetailModel, DateTime>(
                              selector: (ctx, provider) => provider.dateTime,
                              builder: (context, dateTime, child) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0xFFE2E2E2)),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Text(
                                    dateTime.dateToMName(),
                                    style: Inter.semiBold(AppColors.eventTitle)
                                        .s13,
                                  ),
                                );
                              },
                            ),
                            const DateIcons(isNext: true)
                          ],
                        ),
                      ),
                      EventDataView(statesDto: statesDto),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFFFFE7FC)),
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            const CustomImage(
                              source: 'assets/doller.png',
                              height: 100,
                              color: AppColors.buttonColor,
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const BlueContainer(text: 'Total'),
                                Text(
                                  "Revenue",
                                  style: Inter.regular().s16,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "\$${statesDto?.totalRevenue ?? "0"}",
                                  style:
                                      Inter.semiBold(AppColors.buttonColor).s22,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 15)
                    ],
                  ),
                Positioned(
                  right: MediaQuery.sizeOf(context).width * 0.33,
                  child: Container(
                    height: 3,
                    width: MediaQuery.sizeOf(context).width * 0.28,
                    color: AppColors.buttonColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
