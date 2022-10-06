import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/providers/memmeger_api_provider.dart';
import 'package:frontend/screens/sign_up_screen.dart';
import 'package:frontend/screens/user_screen.dart';

import 'package:frontend/widgets/mem/mem_text.dart';
import 'package:provider/provider.dart';

import '../providers/google_sign_in_provider.dart';

class TestScreen extends UserScreen {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Scaffold buildContent(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final texts = AppLocalizations.of(context)!;
    final snackbarContext = ScaffoldMessenger.of(context);
    final provider = Provider.of<UserProvider>(context, listen: false);
    final user = provider.user!;
    return Scaffold(
      appBar: AppBar(
        title: MemText(
          texts.profileTitle,
          textTheme.headline6!,
        ),
      ),
      body: Center(
        child: MemText(
          "Hallo Testwelt!", textTheme.headline6!,
        )
      ),
    );
  }
}
