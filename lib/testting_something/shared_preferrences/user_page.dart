import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/testting_something/shared_preferrences/local/app_local.dart';
import 'package:hyper_ui/testting_something/shared_preferrences/local/user_local.dart';
import 'package:hyper_ui/testting_something/shared_preferrences/model/user_response_model.dart';
import 'package:hyper_ui/testting_something/shared_preferrences/shared_preferences_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String id = '0';
  Map user = {};
  bool isFrist = false;
  String support = '-';
  UserResponseModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "idUSer: $id",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                "User: $user",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                "Frist: $isFrist",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Support: $support",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  showLoading();
                  id = UserLocalStorage.getIdUser() ?? '1';
                  user = UserLocalStorage.getUser() ?? {};
                  isFrist = AppLocalStorage.getGuidline() ?? false;
                  support = UserLocalStorage.getSupportText() ?? '---';
                  hideLoading();
                  setState(() {});
                },
                child: const Text("GetUSer"),
              ),
              userModel != null
                  ? Text(
                      userModel.toString(),
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : CircularProgressIndicator(),
              const SizedBox(
                height: 12.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () async {
                  showLoading();
                  final result = await UserService().getUser();
                  userModel = result;
                  setState(() {});
                  hideLoading();
                },
                child: const Text("FetchUSer"),
              ),
              const SizedBox(
                height: 24.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  UserLocalStorage.clearDbUser();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SharedPreferencesPage()),
                  );
                },
                child: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
