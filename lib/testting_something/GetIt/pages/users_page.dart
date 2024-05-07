import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hyper_ui/testting_something/GetIt/service/user_service.dart';

class UsersPageGetIt extends StatefulWidget {
  const UsersPageGetIt({super.key});

  @override
  State<UsersPageGetIt> createState() => _UsersPageGetItState();
}

class _UsersPageGetItState extends State<UsersPageGetIt> {
  final UserServices _userService = GetIt.instance<UserServices>();
  List<Map<String, dynamic>> users = [];
  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  void loadUsers() async {
    users = await _userService.getUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users Page GetIt"),
        actions: const [],
      ),
      body: ListView.builder(
        itemCount: users.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          log("Running: $users");
          final user = users[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: const NetworkImage(
                  "https://i.ibb.co/QrTHd59/woman.jpg",
                ),
              ),
              title: Text(user['name']),
              subtitle: Text(user['email']),
            ),
          );
        },
      ),
    );
  }
}
