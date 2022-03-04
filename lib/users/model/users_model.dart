import 'package:json_annotation/json_annotation.dart';

part 'users_model.g.dart';

@JsonSerializable()
class UsersModel {
  UsersModel({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.type,
  });

  String? login;
  int? id;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  @JsonKey(name: 'followers_url')
  String? followersUrl;
  @JsonKey(name: 'following_url')
  String? followingUrl;
  Type? type;

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
