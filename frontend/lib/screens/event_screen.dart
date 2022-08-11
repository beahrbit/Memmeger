import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/mem/mem_text.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<String> names = <String>['Emmi', 'Martin', 'Marcus'];
    return Scaffold(
      appBar: AppBar(
        title: MemText(
          title,
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
                      'Standort',
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
                      '00:00 Uhr',
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
                    'Hier kommt die Ememt-Beschreibung rein. Die kann auch über mehrere Zeilen gehen, wenn man möchte',
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
