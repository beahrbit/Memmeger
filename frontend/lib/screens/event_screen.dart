import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/model/event.dart';
import 'package:frontend/widgets/mem/mem_text.dart';

class EventScreen extends StatelessWidget {
  final Event event;

  const EventScreen(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<String> names = <String>['Emmi', 'Martin', 'Marcus'];
    return Scaffold(
      appBar: AppBar(
        title: MemText(
          event.title,
          theme.textTheme.headline6!,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 17),
                    const SizedBox(width: 8),
                    MemText(
                      event.location,
                      theme.textTheme.bodyMedium!,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Icon(Icons.access_time_rounded, size: 17),
                    const SizedBox(width: 8),
                    MemText(
                      Event.dbDateFormat.format(event.date),
                      theme.textTheme.bodyMedium!,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: MemText(
                    event.description,
                    theme.textTheme.bodyMedium!,
                  )),
            ),
            const SizedBox(height: 24),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  MemText(
                    AppLocalizations.of(context)!.eventMemberText,
                    theme.textTheme.bodySmall!,
                  )
                ]),
            Expanded(
                child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return MemText(names[index], theme.textTheme.bodyMedium!);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 8),
            )),
          ],
        ),
      ),
    );
  }
}
