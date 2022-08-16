import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/repo/user_repository.dart';
import 'package:frontend/screens/sign_up_screen.dart';
import 'package:frontend/screens/user_screen.dart';

import 'package:frontend/widgets/mem/mem_text.dart';
import 'package:provider/provider.dart';

import '../providers/google_sign_in_provider.dart';

class ProfileScreen extends UserScreen {
  const ProfileScreen({Key? key}) : super(key: key);

  void onPressLogout(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.googleLogout();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
  }

  void onPressDeleteAccount(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );

    final provider = Provider.of<UserProvider>(context, listen: false);
    await UserRepo.deleteUser(provider.user!);
    provider.googleLogout();
  }

  @override
  Scaffold buildContent(BuildContext context) {
    print('profile screen');
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MemText(user.name, textTheme.titleMedium!),
            const SizedBox(height: 6),
            MemText(user.mail, textTheme.labelMedium!),
            const SizedBox(height: 64),
            ElevatedButton(
              child: MemText(
                texts.authLogoutMessage,
                textTheme.button!,
              ),
              onPressed: () => onPressLogout(context),
            ),
            ElevatedButton(
              child: MemText(
                texts.userDeleteAccount,
                textTheme.button!,
              ),
              onPressed: () => onPressDeleteAccount(context),
            ),
            ElevatedButton(
              child: MemText(
                'Toast ID from DB',
                textTheme.button!,
              ),
              onPressed: () async {
                snackbarContext.showSnackBar(SnackBar(content: Text(user.id)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
