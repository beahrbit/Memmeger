import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:frontend/model/user.dart';

class UserProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _googleAccount;
  GoogleSignInAccount get googleAccount => _googleAccount!;

  User? _user;

  initUser(User u) {
    if (_user != null) return;
    _user = u;
  }

  User? get user => _user;

  Future googleLogin() async {
    final user = await googleSignIn.signIn();
    if (user == null) return;

    _googleAccount = user;
    final auth = await user.authentication;
    final credential = fb.GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );

    await fb.FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
  }

  Future googleLogout() async {
    await googleSignIn.disconnect();
    fb.FirebaseAuth.instance.signOut();
    _user = null;
    notifyListeners();
  }
}
