import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/data/remote/model/event_dto.dart';
import 'package:startick/ui/screens/home/home_viewmodel.dart';
import 'package:startick/ui/screens/home/widgets/current_index_view.dart';
import 'package:startick/ui/screens/home/widgets/event_options.dart';
import 'package:startick/ui/screens/home/widgets/event_slider.dart';
import 'package:startick/ui/screens/home/widgets/event_view.dart';
import 'package:startick/ui/screens/home/widgets/event_view_option.dart';

class HomeEvents extends StatelessWidget {
  const HomeEvents({super.key});

  @override
  Widget build(BuildContext context) {
    int current = context.select<HomeViewModel, int>((pro) => pro.currentIndex);
    return Selector<HomeViewModel, List<EventDto>>(
      selector: (context, provider) => provider.events,
      builder: (context, events, child) {
        if (events.isEmpty) {
          return const Spacer();
        }
        return Expanded(
          child: Column(
            children: [
              Stack(
                children: [
                  const SizedBox(height: 325),
                  EventSlider(eventData: events),
                  Positioned(
                    bottom: 45,
                    right: 20,
                    left: 20,
                    child: EventOptions(event: events[current]),
                  ),
                  const Positioned(
                    bottom: 0,
                    child: EventViewOption(),
                  ),
                  CurrentIndexView(eventsCount: events.length),
                ],
              ),
              Expanded(child: EventView(events: events)),
              const SizedBox(height: 5),
            ],
          ),
        );
      },
    );
  }
}
