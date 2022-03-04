part of 'users_list_bloc.dart';

@immutable
abstract class UsersListState extends Equatable {}

class UsersListInitial extends UsersListState {
  @override
  List<Object?> get props => [];
}

class UsersListLoading extends UsersListState {
  @override
  List<Object?> get props => [];
}

class UsersListSuccess extends UsersListState {
  final List<UsersModel> usersList;

  UsersListSuccess({required this.usersList});
  @override
  List<Object> get props => [usersList];
}

class UsersListFailed extends UsersListState {
  final NetworkExceptions errorMsg;
  UsersListFailed({
    required this.errorMsg,
  });
  @override
  List<Object?> get props => [errorMsg];
}
