import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/model/repo/user_repository.dart';
import 'package:frontend/model/user.dart';
import 'package:frontend/providers/google_sign_in_provider.dart';
import 'package:frontend/screens/profile_screen.dart';
import 'package:frontend/screens/sign_up_screen.dart';
import 'package:frontend/widgets/event_card.dart';
import 'package:provider/provider.dart';

import '../widgets/mem/mem_text.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  void onTapProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textThemes = Theme.of(context).textTheme;
    final texts = AppLocalizations.of(context)!;

    return Scaffold(
      body: StreamBuilder(
        stream: fb.FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: MemText(
                texts.authErrorMessage,
                textThemes.labelMedium!,
              ),
            );
          }
          fb.User? user = fb.FirebaseAuth.instance.currentUser;
          if (!snapshot.hasData || user == null || user.email == null) {
            return const SignUpScreen();
          }
          return FutureBuilder(
            future: UserRepo.getUserIdByMail(user.email!),
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: MemText(
                    texts.noUserFound,
                    textThemes.labelMedium!,
                  ),
                );
              }
              if (!snapshot.hasData) {
                return const SignUpScreen();
              }
              final provider =
                  Provider.of<UserProvider>(context, listen: false);
              provider.initUser(snapshot.data!);
              return buildContent(context);
            },
          );
        },
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    print('events screeen');
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final texts = AppLocalizations.of(context)!;
    final List<String> entries = <String>['See', 'Grillparty', 'Memsa'];

    final provider = Provider.of<UserProvider>(context, listen: false);
    final user = provider.user!;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: MemText(
          AppLocalizations.of(context)!.eventsScreenHeadline,
          theme.textTheme.titleLarge!,
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
