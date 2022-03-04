import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:github_user_project/repository/api_repository.dart';
import 'package:github_user_project/services/network_exception.dart';
import 'package:github_user_project/users/bloc/users_list_bloc.dart';
import 'package:github_user_project/users/view/users_list.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsersListBloc(ApiRepository.getInstance()),
      child: const UserPage(),
    );
  }
}

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    context.read<UsersListBloc>().add(FetchUsersList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UsersListBloc, UsersListState>(
          builder: (context, state) {
            if (state is UsersListSuccess) {
              return UsersList(userList: state.usersList);
            } else if (state is UsersListFailed) {
              return Center(
                  child:
                      Text(NetworkExceptions.getErrorMessage(state.errorMsg)));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
