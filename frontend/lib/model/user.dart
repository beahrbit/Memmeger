import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

class User {
  final String _id;
  final String _name;
  final String _mail;
  final String _photoUrl;

  User(this._id, this._name, this._mail, this._photoUrl);

  /* static Future<User> fromGoogleAuth(GoogleSignInAccount googleAccount) async {
    var getDbUser = (String mail) async {
      Response res = await get("http");
    };
    final String mail = googleAccount.email;
    final Map<String, dynamic>? jsonDbUser = getDbUser(mail);
  } */

  String get id => _id;
  String get name => _name;
  String get mail => _mail;
  String get photoUrl => _photoUrl;
}
