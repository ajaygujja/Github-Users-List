import 'package:github_user_project/users/model/users_model.dart';

abstract class IDataSource {
  Future<UsersModel> getUsersList();
}
