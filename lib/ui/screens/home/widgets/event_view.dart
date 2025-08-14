import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/data/remote/model/event_dto.dart';
import 'package:startick/ui/screens/home/home_viewmodel.dart';
import 'package:startick/ui/screens/home/widgets/event_grid.dart';
import 'package:startick/ui/screens/home/widgets/event_list.dart';

class EventView extends StatelessWidget {
  final List<EventDto> events;

  const EventView({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, bool>(
      selector: (ctx, pro) => pro.listView,
      builder: (context, isListView, child) {
        if (isListView) {
          return EventListView(events: events);
        } else {
          return EventGridView(events: events);
        }
      },
    );
  }
}
