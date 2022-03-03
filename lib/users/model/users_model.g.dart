// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => UsersModel(
      login: json['login'] as String?,
      id: json['id'] as int?,
      avatarUrl: json['avatar_url'] as String?,
      followersUrl: json['followers_url'] as String?,
      followingUrl: json['following_url'] as String?,
      type: $enumDecodeNullable(_$TypeEnumMap, json['type']),
    );

Map<String, dynamic> _$UsersModelToJson(UsersModel instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatar_url': instance.avatarUrl,
      'followers_url': instance.followersUrl,
      'following_url': instance.followingUrl,
      'type': _$TypeEnumMap[instance.type],
    };

const _$TypeEnumMap = {
  Type.ORGANIZATION: 'Organization',
  Type.USER: 'User',
};
