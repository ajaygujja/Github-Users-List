import 'package:github_user_project/domain/api_result.dart';
import 'package:github_user_project/users/model/users_model.dart';

abstract class IDataSource {
  Future<ApiResult<List<UsersModel>>> getUsersList();
}
