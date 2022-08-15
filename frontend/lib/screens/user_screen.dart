import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

import 'package:frontend/repo/user_repository.dart';
import 'package:frontend/model/user.dart';
import 'package:frontend/providers/google_sign_in_provider.dart';
import 'package:frontend/screens/sign_up_screen.dart';
import 'package:frontend/widgets/mem/mem_text.dart';
import 'package:provider/provider.dart';

abstract class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  /// Dont overwrite it
  @override
  @nonVirtual
  Widget build(BuildContext context) {
    final textThemes = Theme.of(context).textTheme;
    final texts = AppLocalizations.of(context)!;

    return StreamBuilder(
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
            final provider = Provider.of<UserProvider>(context, listen: false);
            provider.initUser(snapshot.data!);
            return buildContent(context);
          },
        );
      },
    );
  }

  Scaffold buildContent(BuildContext context);
}
