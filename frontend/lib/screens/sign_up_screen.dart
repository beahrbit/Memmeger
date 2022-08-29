import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:frontend/model/swagger.models.swagger.dart';
import 'package:frontend/providers/memmeger_api_provider.dart';

import 'package:frontend/widgets/mem/mem_logo.dart';
import 'package:frontend/widgets/mem/mem_text.dart';
import 'package:provider/provider.dart';

import '../providers/google_sign_in_provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  Future<User?> register(context, String email, String? username) async {
    final name = username ?? email.substring(0, email.indexOf('@'));
    final user = User(
      userId: '',
      username: name,
      email: email,
    );

    final client =
        Provider.of<MemmegerApiProvider>(context, listen: false).client;

    Response<User> userRes = await client.apiUserPost(body: user);

    if (!userRes.isSuccessful) {
      return null;
    }
    return userRes.body;
  }

  void onGoogleSignUp(context) async {
    final provider = Provider.of<UserProvider>(context, listen: false);
    await provider.googleLogin();

    final client =
        Provider.of<MemmegerApiProvider>(context, listen: false).client;
    final email = provider.googleAccount.email;
    final name = provider.googleAccount.displayName;

    Response<User> userRes = await client.apiUserGetUserByEmailGet(
      email: email,
    );
    User? user;
    if (userRes.isSuccessful) {
      user = userRes.body!;
    } else {
      user = await register(context, email, name);
    }

    if (user == null) {
      provider.googleLogout();
      return;
    }

    provider.initUser(user);
  }

  @override
  Widget build(BuildContext context) {
    final textThemes = Theme.of(context).textTheme;
    final texts = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MemLogo(200),
          const SizedBox(height: 64),
          MemText(
            texts.authLoginMessage,
            textThemes.labelMedium!,
          ),
          const SizedBox(height: 6),
          SignInButton(
            Buttons.Google,
            onPressed: () => onGoogleSignUp(context),
          ),
        ],
      ),
    );
  }
}
