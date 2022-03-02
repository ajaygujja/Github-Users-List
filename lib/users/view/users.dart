import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_user_project/repository/api_repository.dart';
import 'package:github_user_project/users/bloc/users_list_bloc.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsersListBloc(ApiRepository.getInstance()),
      child: UserPage(),
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
    context.read<UsersListBloc>().add(fetchUsersList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UsersListBloc, UsersListState>(
        builder: (context, state) {
          if (state is UsersListSuccess) {
            return Center(child: Text(state.usersList[0].login!));
          } else if (state is UsersListFailed) {
            return Center(child: Text('Failed'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
