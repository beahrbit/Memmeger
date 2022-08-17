import 'package:flutter/material.dart';
import 'package:frontend/model/event.dart';
import 'package:frontend/widgets/event_card.dart';

class EventList extends StatelessWidget {
  final List<Event> events;
  const EventList(this.events, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: events.length,
      itemBuilder: (BuildContext context, int index) {
        return EventCard(events[index]);
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 8),
    );
  }
}
