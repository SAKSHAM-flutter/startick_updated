import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/data/remote/model/event_dto.dart';
import 'package:startick/ui/screens/event_detail/event_detail_viewmodel.dart';
import 'package:startick/ui/screens/event_detail/widgets/event_image.dart';
import 'package:startick/ui/screens/event_detail/widgets/event_statistics_widget.dart';
import 'package:startick/ui/screens/event_detail/widgets/guest_list_widget.dart';
import 'package:startick/ui/screens/event_detail/widgets/headers_view.dart';
import 'package:startick/ui/screens/event_detail/widgets/in_out_view.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/base_class/base_screen.dart';
import 'package:startick/ui/utils/base_class/view_model.dart';

class EventDetail extends StatefulWidget {
  static const String route = "eventDetail";

  const EventDetail({super.key});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  void initState() {
    withViewModel<EventDetailModel>(context, (viewModel) {
      final event = ModalRoute.of(context)?.settings.arguments as Map;
      viewModel.eventDto = event['event'];
      viewModel.currentIndex = event["index"];
      viewModel.init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBaseScaffold<EventDetailModel>(
      toProfile: true,
      child: Selector<EventDetailModel, EventDto?>(
        selector: (ctx, provider) => provider.eventDto,
        builder: (context, eventDto, child) {
          if (eventDto == null) return const SizedBox.shrink();
          return Container(
            // ignore: deprecated_member_use
            color: const Color(0xFFD9D9D9).withOpacity(0.1),
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EventImage(image: eventDto.image),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eventDto.name,
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                          style: Inter.semiBold(const Color(0xFF404040)).s22,
                        ),
                        Text(
                          eventDto.date,
                          style: Inter.regular(const Color(0xFF626262)).s16,
                        ),
                        const Divider(
                          color: Color(0xFFD9D9D9),
                          thickness: 1.5,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: const Row(
                            children: [
                              HeaderView(
                                title: 'Guest List',
                                index: 0,
                                image: 'assets/guest_list.png',
                              ),
                              SizedBox(width: 5),
                              HeaderView(
                                index: 1,
                                title: 'Statistics',
                                image: 'assets/event_stats.png',
                              ),
                              SizedBox(width: 5),
                              HeaderView(
                                index: 2,
                                title: 'In / Out',
                                image: 'assets/in_out.png',
                              ),
                            ],
                          ),
                        ),
                        Selector<EventDetailModel, int>(
                          builder: (ctx, index, child) => <Widget>[
                            const GuestList(),
                            const EventStatistics(),
                            const InOutView(),
                          ][index],
                          selector: (ctx, provider) => provider.currentIndex,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
