import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/model/swagger.models.swagger.dart';
import 'package:frontend/providers/google_sign_in_provider.dart';
import 'package:frontend/providers/memmeger_api_provider.dart';
import 'package:frontend/screens/profile_screen.dart';
import 'package:frontend/screens/test_screen.dart';
import 'package:frontend/screens/user_screen.dart';
import 'package:frontend/widgets/add_event_menu.dart';
import 'package:frontend/widgets/default_future_builder.dart';
import 'package:frontend/widgets/event_list.dart';
import 'package:provider/provider.dart';

import '../widgets/mem/mem_text.dart';

class EventsScreen extends UserScreen {
  const EventsScreen({Key? key}) : super(key: key);

  void onTapProfile(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }

  void onTapTelegram(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TestScreen()),
    );
  }

  @override
  Scaffold buildContent(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final texts = AppLocalizations.of(context)!;

    final provider = Provider.of<UserProvider>(context, listen: false);
    final user = provider.user!;

    final client =
        Provider.of<MemmegerApiProvider>(context, listen: false).client;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: MemText(
          texts.eventsScreenHeadline,
          textTheme.titleLarge!,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.person),
              onTap: () => onTapProfile(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.telegram),
              onTap: () => onTapTelegram(context),
            ),
          )
        ],
      ),
      body: DefaultFutureBuilder<List<Event>>(
        future:
            client.apiEventGetEventsOfUserUseruuidGet(useruuid: user.userId),
        builder: (context, events) {
          if (events.isEmpty) {
            return MemText(
              texts.noEventsFound,
              textTheme.labelMedium!,
            );
          }
          return EventList(events);
        },
        errorMessage: texts.noEventsFound,
      ),
      floatingActionButton: const AddEventMenu(),
    );
  }
}
