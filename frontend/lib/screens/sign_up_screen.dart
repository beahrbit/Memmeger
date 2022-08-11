import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:frontend/widgets/mem/mem_logo.dart';
import 'package:frontend/widgets/mem/mem_text.dart';
import 'package:provider/provider.dart';

import '../providers/google_sign_in_provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.login();
            },
          ),
        ],
      ),
    );
  }
}
