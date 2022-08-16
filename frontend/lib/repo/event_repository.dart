import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/model/event.dart';
import 'package:http/http.dart';

class EventRepo {
  static final eventRoute = "${dotenv.env['API_HOST']}/api/Event";

  static Future<List<Event>> getEventsOfUser(String userId) async {
    Uri uri = Uri.parse(
        Uri.encodeFull('$eventRoute/GetEventsOfUserByUserId/$userId'));
    Response res = await get(uri);

    if (res.statusCode != 200) return List.empty();

    List<dynamic> list = jsonDecode(res.body);

    return list.map((e) => Event.fromJson(e)).toList();
  }
}
