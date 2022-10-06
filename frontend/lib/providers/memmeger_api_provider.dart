import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:frontend/model/swagger.swagger.dart';

class MemmegerApiProvider extends ChangeNotifier {
  Swagger? _client;
  Swagger get client {
    _client ??= _createClient();
    return _client!;
  }

  Swagger _createClient() {
    final chopper = ChopperClient(
      //baseUrl: 'http://5227',
      baseUrl: 'http://10.0.2.2:5227',
      services: [Swagger.create()],
      converter: $JsonSerializableConverter(),
    );
    return Swagger.create(client: chopper);
  }

  MemmegerApiProvider() {
    _client = _createClient();
  }
}
