// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

part 'swagger.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class Event {
  Event({
    required this.eventId,
    this.title,
    this.date,
    this.location,
    this.description,
    this.entryCode,
    this.entryLink,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  @JsonKey(name: 'eventId')
  final String eventId;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'date')
  final DateTime? date;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'entryCode')
  final String? entryCode;
  @JsonKey(name: 'entryLink')
  final String? entryLink;
  static const fromJsonFactory = _$EventFromJson;
  static const toJsonFactory = _$EventToJson;
  Map<String, dynamic> toJson() => _$EventToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Event &&
            (identical(other.eventId, eventId) ||
                const DeepCollectionEquality()
                    .equals(other.eventId, eventId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.entryCode, entryCode) ||
                const DeepCollectionEquality()
                    .equals(other.entryCode, entryCode)) &&
            (identical(other.entryLink, entryLink) ||
                const DeepCollectionEquality()
                    .equals(other.entryLink, entryLink)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(eventId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(entryCode) ^
      const DeepCollectionEquality().hash(entryLink) ^
      runtimeType.hashCode;
}

extension $EventExtension on Event {
  Event copyWith(
      {String? eventId,
      String? title,
      DateTime? date,
      String? location,
      String? description,
      String? entryCode,
      String? entryLink}) {
    return Event(
        eventId: eventId ?? this.eventId,
        title: title ?? this.title,
        date: date ?? this.date,
        location: location ?? this.location,
        description: description ?? this.description,
        entryCode: entryCode ?? this.entryCode,
        entryLink: entryLink ?? this.entryLink);
  }
}

extension $EventWrappedExtension on Event {
  Event copyWith(
      {Wrapped<String>? eventId,
      Wrapped<String?>? title,
      Wrapped<DateTime?>? date,
      Wrapped<String?>? location,
      Wrapped<String?>? description,
      Wrapped<String?>? entryCode,
      Wrapped<String?>? entryLink}) {
    return Event(
        eventId: (eventId != null ? eventId.value : this.eventId),
        title: (title != null ? title.value : this.title),
        date: (date != null ? date.value : this.date),
        location: (location != null ? location.value : this.location),
        description:
            (description != null ? description.value : this.description),
        entryCode: (entryCode != null ? entryCode.value : this.entryCode),
        entryLink: (entryLink != null ? entryLink.value : this.entryLink));
  }
}

@JsonSerializable(explicitToJson: true)
class Eventuser {
  Eventuser({
    required this.eventId,
    required this.userId,
    this.invitationState,
    this.role,
    this.username,
  });

  factory Eventuser.fromJson(Map<String, dynamic> json) =>
      _$EventuserFromJson(json);

  @JsonKey(name: 'eventId')
  final String eventId;
  @JsonKey(name: 'userId')
  final String userId;
  @JsonKey(name: 'invitationState')
  final String? invitationState;
  @JsonKey(name: 'role')
  final String? role;
  @JsonKey(name: 'username')
  final String? username;
  static const fromJsonFactory = _$EventuserFromJson;
  static const toJsonFactory = _$EventuserToJson;
  Map<String, dynamic> toJson() => _$EventuserToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Eventuser &&
            (identical(other.eventId, eventId) ||
                const DeepCollectionEquality()
                    .equals(other.eventId, eventId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.invitationState, invitationState) ||
                const DeepCollectionEquality()
                    .equals(other.invitationState, invitationState)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(eventId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(invitationState) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(username) ^
      runtimeType.hashCode;
}

extension $EventuserExtension on Eventuser {
  Eventuser copyWith(
      {String? eventId,
      String? userId,
      String? invitationState,
      String? role,
      String? username}) {
    return Eventuser(
        eventId: eventId ?? this.eventId,
        userId: userId ?? this.userId,
        invitationState: invitationState ?? this.invitationState,
        role: role ?? this.role,
        username: username ?? this.username);
  }
}

extension $EventuserWrappedExtension on Eventuser {
  Eventuser copyWith(
      {Wrapped<String>? eventId,
      Wrapped<String>? userId,
      Wrapped<String?>? invitationState,
      Wrapped<String?>? role,
      Wrapped<String?>? username}) {
    return Eventuser(
        eventId: (eventId != null ? eventId.value : this.eventId),
        userId: (userId != null ? userId.value : this.userId),
        invitationState: (invitationState != null
            ? invitationState.value
            : this.invitationState),
        role: (role != null ? role.value : this.role),
        username: (username != null ? username.value : this.username));
  }
}

@JsonSerializable(explicitToJson: true)
class Member {
  Member({
    required this.eventId,
    required this.userId,
    this.invitationState,
    this.role,
  });

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  @JsonKey(name: 'eventId')
  final String eventId;
  @JsonKey(name: 'userId')
  final String userId;
  @JsonKey(name: 'invitationState')
  final String? invitationState;
  @JsonKey(name: 'role')
  final String? role;
  static const fromJsonFactory = _$MemberFromJson;
  static const toJsonFactory = _$MemberToJson;
  Map<String, dynamic> toJson() => _$MemberToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Member &&
            (identical(other.eventId, eventId) ||
                const DeepCollectionEquality()
                    .equals(other.eventId, eventId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.invitationState, invitationState) ||
                const DeepCollectionEquality()
                    .equals(other.invitationState, invitationState)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(eventId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(invitationState) ^
      const DeepCollectionEquality().hash(role) ^
      runtimeType.hashCode;
}

extension $MemberExtension on Member {
  Member copyWith(
      {String? eventId,
      String? userId,
      String? invitationState,
      String? role}) {
    return Member(
        eventId: eventId ?? this.eventId,
        userId: userId ?? this.userId,
        invitationState: invitationState ?? this.invitationState,
        role: role ?? this.role);
  }
}

extension $MemberWrappedExtension on Member {
  Member copyWith(
      {Wrapped<String>? eventId,
      Wrapped<String>? userId,
      Wrapped<String?>? invitationState,
      Wrapped<String?>? role}) {
    return Member(
        eventId: (eventId != null ? eventId.value : this.eventId),
        userId: (userId != null ? userId.value : this.userId),
        invitationState: (invitationState != null
            ? invitationState.value
            : this.invitationState),
        role: (role != null ? role.value : this.role));
  }
}

@JsonSerializable(explicitToJson: true)
class User {
  User({
    required this.userId,
    this.username,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @JsonKey(name: 'userId')
  final String userId;
  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'email')
  final String? email;
  static const fromJsonFactory = _$UserFromJson;
  static const toJsonFactory = _$UserToJson;
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is User &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(email) ^
      runtimeType.hashCode;
}

extension $UserExtension on User {
  User copyWith({String? userId, String? username, String? email}) {
    return User(
        userId: userId ?? this.userId,
        username: username ?? this.username,
        email: email ?? this.email);
  }
}

extension $UserWrappedExtension on User {
  User copyWith(
      {Wrapped<String>? userId,
      Wrapped<String?>? username,
      Wrapped<String?>? email}) {
    return User(
        userId: (userId != null ? userId.value : this.userId),
        username: (username != null ? username.value : this.username),
        email: (email != null ? email.value : this.email));
  }
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
