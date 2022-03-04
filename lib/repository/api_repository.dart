import 'package:dio/dio.dart';
import 'package:github_user_project/domain/api_result.dart';
import 'package:github_user_project/domain/remote_repository.dart';
import 'package:github_user_project/domain/web_services.dart';
import 'package:github_user_project/services/dio_client.dart';
import 'package:github_user_project/users/model/users_model.dart';

class ApiRepository extends IDataSource {
  final IDataSource _webService;

  static ApiRepository? _instance;

  DioClient? dioClient;

  ApiRepository._(
    this._webService,
  );

  static ApiRepository getInstance() {
    if (_instance == null) {
      var dio = Dio();
      _instance = ApiRepository._(
        WebServices(
          dioClient: DioClient(BASE_URL, dio),
        ),
      );
    }

    return _instance!;
  }

  @override
  Future<ApiResult<List<UsersModel>>> getUsersList() {
    return _webService.getUsersList();
  }
}
