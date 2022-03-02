// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => UsersModel(
      login: json['login'] as String,
      id: json['id'] as int,
      avatarUrl: json['avatarUrl'] as String,
      gravatarId: json['gravatarId'] as String,
      followersUrl: json['followersUrl'] as String,
      followingUrl: json['followingUrl'] as String,
      type: $enumDecode(_$TypeEnumMap, json['type']),
    );

Map<String, dynamic> _$UsersModelToJson(UsersModel instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatarUrl': instance.avatarUrl,
      'gravatarId': instance.gravatarId,
      'followersUrl': instance.followersUrl,
      'followingUrl': instance.followingUrl,
      'type': _$TypeEnumMap[instance.type],
    };

const _$TypeEnumMap = {
  Type.ORGANIZATION: 'Organization',
  Type.USER: 'User',
};
