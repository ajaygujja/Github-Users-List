import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:github_user_project/repository/api_repository.dart';
import 'package:github_user_project/services/network_exception.dart';
import 'package:github_user_project/users/bloc/users_list_bloc.dart';
import 'package:github_user_project/users/model/users_model.dart';

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

class UsersList extends StatelessWidget {
  const UsersList({
    Key? key,
    required this.userList,
  }) : super(key: key);

  final List<UsersModel> userList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (BuildContext context, int index) {
        return UsersListTile(user: userList[index]);
      },
    );
  }
}

class UsersListTile extends StatelessWidget {
  const UsersListTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UsersModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          user.avatarUrl ??
              "https://avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar.png",
        ),
      ),
      title: Text(
        user.login!,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
