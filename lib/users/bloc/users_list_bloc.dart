import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_user_project/users/model/users_model.dart';
import 'package:meta/meta.dart';

part 'users_list_event.dart';
part 'users_list_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  UsersListBloc() : super(UsersListInitial()) {
    on<UsersListEvent>((event, emit) {});
  }
}
