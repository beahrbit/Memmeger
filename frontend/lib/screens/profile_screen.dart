import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/main.dart';

import 'package:frontend/widgets/mem/mem_text.dart';
import 'package:provider/provider.dart';

import '../providers/google_sign_in_provider.dart';

import 'package:http/http.dart';
import 'dart:convert';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final texts = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser!;

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
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            const SizedBox(height: 12),
            MemText(user.displayName!, textTheme.titleMedium!),
            const SizedBox(height: 6),
            MemText(user.email!, textTheme.labelMedium!),
            const SizedBox(height: 64),
            ElevatedButton(
              child: MemText(
                texts.authLogoutMessage,
                textTheme.button!,
              ),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            ElevatedButton(
              child: MemText(
                'Test',
                textTheme.button!,
              ),
              onPressed: () async {
                print('pressed');
                Uri uri = Uri.parse(
                    'http://localhost:5000/api/User/marcuspiele%40gmail.com');
                Response res = await get(uri);
                if (res.statusCode == 200) {
                  List<dynamic> body = jsonDecode(res.body);
                  print(body);
                } else {
                  print('fail haha');
                  throw "Unable to retrieve posts.";
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
