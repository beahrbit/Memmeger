import 'package:flutter/material.dart';
import 'package:frontend/model/swagger.models.swagger.dart';
import 'package:frontend/screens/event_screen.dart';
import 'package:intl/intl.dart';

import 'mem/mem_text.dart';

class EventCard extends StatelessWidget {
  static final DateFormat dbDateFormat = DateFormat('yyyy-MM-dd');

  final Event event;

  const EventCard(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EventScreen(event)),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MemText(event.title ?? '', theme.textTheme.titleLarge!),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 15),
                  const SizedBox(width: 8),
                  MemText(
                    event.location ?? '',
                    theme.textTheme.bodyMedium!,
                  )
                ],
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  const Icon(Icons.access_time_rounded, size: 15),
                  const SizedBox(width: 8),
                  MemText(
                    dbDateFormat.format(event.date ?? DateTime.now()),
                    theme.textTheme.bodyMedium!,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
