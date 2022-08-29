import 'swagger.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'package:chopper/chopper.dart' as chopper;
export 'swagger.models.swagger.dart';

part 'swagger.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Swagger extends ChopperService {
  static Swagger create(
      {ChopperClient? client,
      Authenticator? authenticator,
      String? baseUrl,
      Iterable<dynamic>? interceptors}) {
    if (client != null) {
      return _$Swagger(client);
    }

    final newClient = ChopperClient(
        services: [_$Swagger()],
        converter: $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        authenticator: authenticator,
        baseUrl: baseUrl ?? 'http://');
    return _$Swagger(newClient);
  }

  ///
  Future<chopper.Response<List<Event>>> apiEventGet() {
    generatedMapping.putIfAbsent(Event, () => Event.fromJsonFactory);

    return _apiEventGet();
  }

  ///
  @Get(path: '/api/Event')
  Future<chopper.Response<List<Event>>> _apiEventGet();

  ///
  Future<chopper.Response<Event>> apiEventPost({required Event? body}) {
    generatedMapping.putIfAbsent(Event, () => Event.fromJsonFactory);

    return _apiEventPost(body: body);
  }

  ///
  @Post(path: '/api/Event')
  Future<chopper.Response<Event>> _apiEventPost({@Body() required Event? body});

  ///
  Future<chopper.Response<Event>> apiEventPut({required Event? body}) {
    generatedMapping.putIfAbsent(Event, () => Event.fromJsonFactory);

    return _apiEventPut(body: body);
  }

  ///
  @Put(path: '/api/Event')
  Future<chopper.Response<Event>> _apiEventPut({@Body() required Event? body});

  ///
  ///@param eventuuid
  Future<chopper.Response<Event>> apiEventGetEventByIdGet({String? eventuuid}) {
    generatedMapping.putIfAbsent(Event, () => Event.fromJsonFactory);

    return _apiEventGetEventByIdGet(eventuuid: eventuuid);
  }

  ///
  ///@param eventuuid
  @Get(path: '/api/Event/GetEventById')
  Future<chopper.Response<Event>> _apiEventGetEventByIdGet(
      {@Query('eventuuid') String? eventuuid});

  ///
  ///@param useruuid
  Future<chopper.Response<List<Event>>> apiEventGetEventsOfUserUseruuidGet(
      {required String? useruuid}) {
    generatedMapping.putIfAbsent(Event, () => Event.fromJsonFactory);

    return _apiEventGetEventsOfUserUseruuidGet(useruuid: useruuid);
  }

  ///
  ///@param useruuid
  @Get(path: '/api/Event/GetEventsOfUser/{useruuid}')
  Future<chopper.Response<List<Event>>> _apiEventGetEventsOfUserUseruuidGet(
      {@Path('useruuid') required String? useruuid});

  ///
  ///@param eventuuid
  Future<chopper.Response<List<Eventuser>>> apiEventGetEventmemberByEventIdGet(
      {String? eventuuid}) {
    generatedMapping.putIfAbsent(Eventuser, () => Eventuser.fromJsonFactory);

    return _apiEventGetEventmemberByEventIdGet(eventuuid: eventuuid);
  }

  ///
  ///@param eventuuid
  @Get(path: '/api/Event/GetEventmemberByEventId')
  Future<chopper.Response<List<Eventuser>>> _apiEventGetEventmemberByEventIdGet(
      {@Query('eventuuid') String? eventuuid});

  ///
  ///@param id
  Future<chopper.Response<Event>> apiEventIdDelete({required String? id}) {
    generatedMapping.putIfAbsent(Event, () => Event.fromJsonFactory);

    return _apiEventIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/Event/{id}')
  Future<chopper.Response<Event>> _apiEventIdDelete(
      {@Path('id') required String? id});

  ///
  Future<chopper.Response<List<Member>>> apiMembershipGet() {
    generatedMapping.putIfAbsent(Member, () => Member.fromJsonFactory);

    return _apiMembershipGet();
  }

  ///
  @Get(path: '/api/Membership')
  Future<chopper.Response<List<Member>>> _apiMembershipGet();

  ///
  Future<chopper.Response<Event>> apiMembershipPost({required Member? body}) {
    generatedMapping.putIfAbsent(Event, () => Event.fromJsonFactory);

    return _apiMembershipPost(body: body);
  }

  ///
  @Post(path: '/api/Membership')
  Future<chopper.Response<Event>> _apiMembershipPost(
      {@Body() required Member? body});

  ///
  ///@param eventId
  ///@param userId
  Future<chopper.Response<Member>> apiMembershipEventIdUserIdDelete(
      {required String? eventId, required String? userId}) {
    generatedMapping.putIfAbsent(Member, () => Member.fromJsonFactory);

    return _apiMembershipEventIdUserIdDelete(eventId: eventId, userId: userId);
  }

  ///
  ///@param eventId
  ///@param userId
  @Delete(path: '/api/Membership/{eventId}/{userId}')
  Future<chopper.Response<Member>> _apiMembershipEventIdUserIdDelete(
      {@Path('eventId') required String? eventId,
      @Path('userId') required String? userId});

  ///
  Future<chopper.Response<List<User>>> apiUserGet() {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _apiUserGet();
  }

  ///
  @Get(path: '/api/User')
  Future<chopper.Response<List<User>>> _apiUserGet();

  ///
  Future<chopper.Response<User>> apiUserPost({required User? body}) {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _apiUserPost(body: body);
  }

  ///
  @Post(path: '/api/User')
  Future<chopper.Response<User>> _apiUserPost({@Body() required User? body});

  ///
  Future<chopper.Response<User>> apiUserPut({required User? body}) {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _apiUserPut(body: body);
  }

  ///
  @Put(path: '/api/User')
  Future<chopper.Response<User>> _apiUserPut({@Body() required User? body});

  ///
  ///@param useruuid
  Future<chopper.Response<User>> apiUserGetUserByIdGet({String? useruuid}) {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _apiUserGetUserByIdGet(useruuid: useruuid);
  }

  ///
  ///@param useruuid
  @Get(path: '/api/User/GetUserById')
  Future<chopper.Response<User>> _apiUserGetUserByIdGet(
      {@Query('useruuid') String? useruuid});

  ///
  ///@param email
  Future<chopper.Response<User>> apiUserGetUserByEmailGet({String? email}) {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _apiUserGetUserByEmailGet(email: email);
  }

  ///
  ///@param email
  @Get(path: '/api/User/GetUserByEmail')
  Future<chopper.Response<User>> _apiUserGetUserByEmailGet(
      {@Query('email') String? email});

  ///
  ///@param id
  Future<chopper.Response<List<User>>> apiUserIdDelete({required String? id}) {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _apiUserIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/User/{id}')
  Future<chopper.Response<List<User>>> _apiUserIdDelete(
      {@Path('id') required String? id});
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(
      chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
