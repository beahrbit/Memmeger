import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:frontend/model/swagger.models.swagger.dart';
import 'package:frontend/providers/memmeger_api_provider.dart';

import 'package:frontend/providers/google_sign_in_provider.dart';
import 'package:frontend/screens/sign_up_screen.dart';
import 'package:frontend/widgets/default_future_builder.dart';
import 'package:frontend/widgets/mem/mem_text.dart';
import 'package:provider/provider.dart';

abstract class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    final textThemes = Theme.of(context).textTheme;
    final texts = AppLocalizations.of(context)!;
    final client = Provider.of<MemmegerApiProvider>(context).client;

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
        return DefaultFutureBuilder<User>(
          // future: UserRepo.getUserIdByMail(user.email!),
          future: client.apiUserGetUserByEmailGet(email: user.email!),
          builder: ((context, data) {
            final provider = Provider.of<UserProvider>(context, listen: false);
            provider.initUser(data);
            return buildContent(context);
          }),
          errorMessage: texts.noUserFound,
          noData: const SignUpScreen(),
        );
      },
    );
  }

  Scaffold buildContent(BuildContext context);
}
