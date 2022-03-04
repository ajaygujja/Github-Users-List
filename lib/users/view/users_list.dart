import 'package:flutter/material.dart';
import 'package:github_user_project/users/model/users_model.dart';

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
