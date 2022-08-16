import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/model/user.dart';
import 'package:http/http.dart';

class UserRepo {
  static final userRoute = "${dotenv.env['API_HOST']}/api/User";

  static Future<User?> getUserIdByMail(String email) async {
    Uri uri =
        Uri.parse(Uri.encodeFull('$userRoute/GetUserByEmail?email=$email'));
    Response res = await get(uri);

    if (res.statusCode != 200) return null;

    List<dynamic> body = jsonDecode(res.body);
    if (body.isEmpty) return null;

    return User.fromJson(body[0]);
  }

  static Future<User?> register(String email, String? username) async {
    final name = username ?? email.substring(0, email.indexOf('@'));
    final data = jsonEncode(User('', name, email));

    Uri uri = Uri.parse(Uri.encodeFull(userRoute));

    Response res = await post(
      uri,
      body: data,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (res.statusCode != 200) {
      return null;
    }

    return User.fromJson(jsonDecode(res.body));
  }

  static Future<bool> deleteUser(User user) async {
    final userId = user.id;
    Uri uri = Uri.parse(Uri.encodeFull('$userRoute/$userId'));
    Response res = await delete(uri);

    return res.statusCode == 200;
  }
}
