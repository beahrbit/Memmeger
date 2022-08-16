import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/providers/google_sign_in_provider.dart';
import 'package:frontend/screens/profile_screen.dart';
import 'package:frontend/screens/user_screen.dart';
import 'package:frontend/widgets/event_card.dart';
import 'package:provider/provider.dart';

import '../widgets/mem/mem_text.dart';

class EventsScreen extends UserScreen {
  const EventsScreen({Key? key}) : super(key: key);

  void onTapProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }

  @override
  Scaffold buildContent(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final texts = AppLocalizations.of(context)!;
    final List<String> entries = <String>['See', 'Grillparty', 'Memsa'];

    final provider = Provider.of<UserProvider>(context, listen: false);
    final user = provider.user!;

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
      ),
    );
  }
}
