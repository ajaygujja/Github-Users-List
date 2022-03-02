import 'package:github_user_project/services/network_exception.dart';
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

  String? login;
  int? id;
  String? avatarUrl;
  String? gravatarId;
  String? followersUrl;
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
