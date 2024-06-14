import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ProfileController extends State<ProfileView> {
  static late ProfileController instance;
  late ProfileView view;
  int? userId;
  String version = '';

  @override
  void initState() {
    instance = this;
    getProfile();
    getLoading();
    getDumping();
    getNama();
    _initPackageInfo();

    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  Future<void> doLogout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Logout'),
          content: Text('Apakah Anda yakin ingin logout?'),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Batal"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove('token');

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  Map<String, dynamic> profile = {}; // Change the type to Map<String, dynamic>

  getProfile() async {
    dynamic profileData = await ProfileService()
        .get(); // Assuming ProfileService().get() returns dynamic
    if (profileData is Map<String, dynamic>) {
      profile = profileData;
      setState(() {});
    } else {
      // Handle the case where profileData is not in the expected format
      print("Profile data is not in the expected format.");
    }
  }

  Future<void> getNama() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id_user');
  }

  List<dynamic> loading = [];

  getLoading() async {
    loading = await LoadingService().get();
    setState(() {
      loading = loading.where((item) {
        return item['attributes']['id_user'] == userId;
      }).toList();
    });
  }

  List<dynamic> hauling = [];
  getHauling() async {
    hauling = await HaulingService().get();
    setState(() {
      hauling = hauling.where((item) {
        return item['attributes']['id_user'] == userId;
      }).toList();
    });
  }

  List<dynamic> dumping = [];
  getDumping() async {
    dumping = await DumpingService().get();
    setState(() {
      dumping = dumping.where((item) {
        return item['attributes']['id_user'] == userId;
      }).toList();
    });
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      version = info.version;
    });
  }
}
