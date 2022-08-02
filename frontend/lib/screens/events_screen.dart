import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/widgets/event_card.dart';

import '../widgets/mem_text.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<String> entries = <String>['See', 'Grillparty', 'Memsa'];
    return Scaffold(
        appBar: AppBar(
          title: MemText(
            AppLocalizations.of(context)!.eventsScreenHeadline,
            theme.textTheme.titleLarge!,
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.person),
                )),
          ],
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return EventCard(title: entries[index]);
          },
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 8),
        ));
  }
}
