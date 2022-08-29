// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$Swagger extends Swagger {
  _$Swagger([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Swagger;

  @override
  Future<Response<List<Event>>> _apiEventGet() {
    final $url = '/api/Event';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<Event>, Event>($request);
  }

  @override
  Future<Response<Event>> _apiEventPost({required Event? body}) {
    final $url = '/api/Event';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Event, Event>($request);
  }

  @override
  Future<Response<Event>> _apiEventPut({required Event? body}) {
    final $url = '/api/Event';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<Event, Event>($request);
  }

  @override
  Future<Response<Event>> _apiEventGetEventByIdGet({String? eventuuid}) {
    final $url = '/api/Event/GetEventById';
    final $params = <String, dynamic>{'eventuuid': eventuuid};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Event, Event>($request);
  }

  @override
  Future<Response<List<Event>>> _apiEventGetEventsOfUserUseruuidGet(
      {required String? useruuid}) {
    final $url = '/api/Event/GetEventsOfUser/${useruuid}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<Event>, Event>($request);
  }

  @override
  Future<Response<List<Eventuser>>> _apiEventGetEventmemberByEventIdGet(
      {String? eventuuid}) {
    final $url = '/api/Event/GetEventmemberByEventId';
    final $params = <String, dynamic>{'eventuuid': eventuuid};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<Eventuser>, Eventuser>($request);
  }

  @override
  Future<Response<Event>> _apiEventIdDelete({required String? id}) {
    final $url = '/api/Event/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<Event, Event>($request);
  }

  @override
  Future<Response<List<Member>>> _apiMembershipGet() {
    final $url = '/api/Membership';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<Member>, Member>($request);
  }

  @override
  Future<Response<Event>> _apiMembershipPost({required Member? body}) {
    final $url = '/api/Membership';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Event, Event>($request);
  }

  @override
  Future<Response<Member>> _apiMembershipEventIdUserIdDelete(
      {required String? eventId, required String? userId}) {
    final $url = '/api/Membership/${eventId}/${userId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<Member, Member>($request);
  }

  @override
  Future<Response<List<User>>> _apiUserGet() {
    final $url = '/api/User';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<User>, User>($request);
  }

  @override
  Future<Response<User>> _apiUserPost({required User? body}) {
    final $url = '/api/User';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<User, User>($request);
  }

  @override
  Future<Response<User>> _apiUserPut({required User? body}) {
    final $url = '/api/User';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<User, User>($request);
  }

  @override
  Future<Response<User>> _apiUserGetUserByIdGet({String? useruuid}) {
    final $url = '/api/User/GetUserById';
    final $params = <String, dynamic>{'useruuid': useruuid};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<User, User>($request);
  }

  @override
  Future<Response<User>> _apiUserGetUserByEmailGet({String? email}) {
    final $url = '/api/User/GetUserByEmail';
    final $params = <String, dynamic>{'email': email};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<User, User>($request);
  }

  @override
  Future<Response<List<User>>> _apiUserIdDelete({required String? id}) {
    final $url = '/api/User/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<List<User>, User>($request);
  }
}
