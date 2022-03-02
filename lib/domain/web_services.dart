import 'package:github_user_project/domain/remote_repository.dart';
import 'package:github_user_project/services/dio_client.dart';
import 'package:github_user_project/users/model/users_model.dart';

class WebServices extends IDataSource {
  final DioClient? dioClient;

  WebServices({
    required this.dioClient,
  }) : assert(
          dioClient != null,
          "DioClient cannot be null",
        );

  @override
  Future<UsersModel> getUsersList() {
    throw UnimplementedError();
  }
}
