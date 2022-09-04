import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/model/swagger.models.swagger.dart';
import 'package:frontend/widgets/mem/mem_text.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EventScreen extends StatelessWidget {
  static final DateFormat dbDateFormat = DateFormat('yyyy-MM-dd');

  final Event event;

  const EventScreen(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<String> names = <String>['Emmi', 'Martin', 'Marcus'];
    final texts = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: MemText(
          event.title ?? '',
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
                      event.location ?? '',
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
                      dbDateFormat.format(event.date ?? DateTime.now()),
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
                    event.description ?? '',
                    theme.textTheme.bodyMedium!,
                  )),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                MemText(
                  texts.eventMemberText,
                  theme.textTheme.bodySmall!,
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index) {
                  return MemText(names[index], theme.textTheme.bodyMedium!);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 8),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                MemText(
                  texts.eventShareHeadline,
                  theme.textTheme.bodySmall!,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                QrImage(
                  backgroundColor: Colors.white,
                  data: event.eventId,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SelectableText(
                  event.eventId,
                  style: theme.textTheme.bodyMedium!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
