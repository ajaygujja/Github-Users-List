import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_user_project/services/network_exception.dart';
import 'package:github_user_project/users/model/users_model.dart';

part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({required List<UsersModel> data}) =
      Success<T>;
  const factory ApiResult.failure({required NetworkExceptions error}) =
      Failure<T>;
}
