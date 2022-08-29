// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      eventId: json['eventId'] as String,
      title: json['title'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      location: json['location'] as String?,
      description: json['description'] as String?,
      entryCode: json['entryCode'] as String?,
      entryLink: json['entryLink'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'eventId': instance.eventId,
      'title': instance.title,
      'date': instance.date?.toIso8601String(),
      'location': instance.location,
      'description': instance.description,
      'entryCode': instance.entryCode,
      'entryLink': instance.entryLink,
    };

Eventuser _$EventuserFromJson(Map<String, dynamic> json) => Eventuser(
      eventId: json['eventId'] as String,
      userId: json['userId'] as String,
      invitationState: json['invitationState'] as String?,
      role: json['role'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$EventuserToJson(Eventuser instance) => <String, dynamic>{
      'eventId': instance.eventId,
      'userId': instance.userId,
      'invitationState': instance.invitationState,
      'role': instance.role,
      'username': instance.username,
    };

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      eventId: json['eventId'] as String,
      userId: json['userId'] as String,
      invitationState: json['invitationState'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'eventId': instance.eventId,
      'userId': instance.userId,
      'invitationState': instance.invitationState,
      'role': instance.role,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['userId'] as String,
      username: json['username'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'email': instance.email,
    };
