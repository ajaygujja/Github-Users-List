import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_user_project/domain/api_result.dart';
import 'package:github_user_project/repository/api_repository.dart';
import 'package:github_user_project/services/network_exception.dart';
import 'package:github_user_project/users/model/users_model.dart';
import 'package:meta/meta.dart';

part 'users_list_event.dart';
part 'users_list_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  final ApiRepository apiRepository;

  UsersListBloc(this.apiRepository) : super(UsersListInitial()) {
    on<UsersListEvent>((event, emit) async {
      if (event is FetchUsersList) {
        emit(UsersListLoading());

        ApiResult<List<UsersModel>> apiResult =
            await apiRepository.getUsersList();

        apiResult.when(success: (List<UsersModel> data) async {
          emit(UsersListSuccess(usersList: data));
        }, failure: (NetworkExceptions error) async {
          emit(UsersListFailed(errorMsg: error));
        });
      }
    });
  }
}
