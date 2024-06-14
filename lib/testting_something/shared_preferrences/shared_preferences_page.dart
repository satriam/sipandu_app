// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';

class SharedPreferencesPage extends StatefulWidget {
  const SharedPreferencesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SharedPreferencesPage> createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  String id = '0';
  Map user = {};
  bool isFrist = false;
  String supportText = 'kosong';

  @override
  void initState() {
    id = UserLocalStorage.getIdUser() ?? '1';
    user = UserLocalStorage.getUser() ?? {};
    supportText = UserLocalStorage.getSupportText() ?? '-';
    isFrist = AppLocalStorage.getGuidline() ?? false;
    print("page: $isFrist");
    print("pageSupport: $supportText");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "idUSer: $id",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                "User: $user",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                "Frist: $isFrist",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "support: $supportText",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 28.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  AppLocalStorage.setGuidline(true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => UserPage()),
                  );
                },
                child: const Text("User"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserService {
  final dioService = DioService();
  // getUser() async {
  //   // final dio = Dio();
  //   // dio.interceptors.add(TalkerDioLogger(
  //   //     talker: talker,
  //   //     settings: TalkerDioLoggerSettings(
  //   //       printRequestHeaders: true,
  //   //       printResponseHeaders: true,
  //   //       printRequestData: true,
  //   //       printResponseData: true,
  //   //       printResponseMessage: true,
  //   //       //   requestFilter: (requestOptions) => true,
  //   //       //  responseFilter: (response) => true,
  //   //       //  errorPen: AnsiPen()..xterm(121),
  //   //       //  requestPen: AnsiPen()..xterm(121),
  //   //       //  responsePen: AnsiPen()..xterm(121),
  //   //     )));
  //   var id = 2;
  //   var response = await dioService.dio.get(
  //     "https://reqres.in/api/users/$id",
  //     options: Options(
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //     ),
  //   );
  //   Map obj = response.data;
  //   UserLocalStorage.setUser(obj);
  //   UserLocalStorage.setIdUser(obj['data']['id'].toString());
  // }
  Future<UserResponseModel> getUser() async {
    // final dio = Dio();
    // dio.interceptors.add(TalkerDioLogger(
    //     talker: talker,
    //     settings: TalkerDioLoggerSettings(
    //       printRequestHeaders: true,
    //       printResponseHeaders: true,
    //       printRequestData: true,
    //       printResponseData: true,
    //       printResponseMessage: true,
    //       //   requestFilter: (requestOptions) => true,
    //       //  responseFilter: (response) => true,
    //       //  errorPen: AnsiPen()..xterm(121),
    //       //  requestPen: AnsiPen()..xterm(121),
    //       //  responsePen: AnsiPen()..xterm(121),
    //     )));
    var id = 2;
    var response = await dioService.dio.get(
      "https://reqres.in/api/users/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    final user = UserResponseModel.fromJson(obj['data']);
    return user;
  }
}
