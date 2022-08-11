import 'package:flutter/material.dart';
import 'package:frontend/screens/event_screen.dart';

import 'mem/mem_text.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EventScreen(title: title)),
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
              MemText(title, theme.textTheme.titleLarge!),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 15),
                  const SizedBox(width: 8),
                  MemText(
                    'Standort',
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
                    '00:00 Uhr',
                    theme.textTheme.bodyMedium!,
                  )
                ],
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  const Icon(Icons.person, size: 15),
                  const SizedBox(width: 8),
                  MemText(
                    'Emmi, Martin, Marcus',
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
