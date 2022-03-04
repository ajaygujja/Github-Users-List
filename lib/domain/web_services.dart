import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:github_user_project/domain/api_result.dart';
import 'package:github_user_project/domain/remote_repository.dart';
import 'package:github_user_project/services/dio_client.dart';
import 'package:github_user_project/services/network_exception.dart';
import 'package:github_user_project/users/model/users_model.dart';

class WebServices extends IDataSource {
  final DioClient? dioClient;

  WebServices({
    required this.dioClient,
  }) : assert(dioClient != null, "DioClient cannot be null");

  @override
  Future<ApiResult<List<UsersModel>>> getUsersList() async {
    try {
      final response =
          await dioClient!.request(url: "users", method: Method.GET);

      if (response.statusCode != null && response.statusCode == 200) {
        final parser = SearchResultsParser();

        return ApiResult.success(
            data: await parser.parseInBackground(response.data as String));
      } else {
        return ApiResult.failure(
            error:
                NetworkExceptions.handleResponse(response.statusCode ?? 500));
      }
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }
}

class SearchResultsParser {
  Future<List<UsersModel>> parseInBackground(String encodedJson) {
    // compute spawns an isolate,
    // runs a callback on that isolate,
    // and returns a Future with the result
    return compute(_decodeAndParseJson, encodedJson);
  }

  List<UsersModel> _decodeAndParseJson(String encodedJson) {
    final List<UsersModel> jsonData = List<UsersModel>.from(
        json.decode(encodedJson).map((x) => UsersModel.fromJson(x)));

    return jsonData;
  }
}
