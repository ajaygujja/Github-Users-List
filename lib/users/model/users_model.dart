import 'package:json_annotation/json_annotation.dart';

part 'users_model.g.dart';

@JsonSerializable()
class UsersModel {
  UsersModel({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.gravatarId,
    required this.followersUrl,
    required this.followingUrl,
    required this.type,
  });

  final String login;
  final int id;
  final String avatarUrl;
  final String gravatarId;
  final String followersUrl;
  final String followingUrl;
  final Type type;

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);
  Map<String, dynamic> toJson() => _$UsersModelToJson(this);
}

enum Type {
  @JsonValue('Organization')
  ORGANIZATION,
  @JsonValue('User')
  USER,
}
