import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/service_dumping/dumping_service.dart';
import 'package:hyper_ui/service/service_hauling/hauling_service.dart';
import 'package:hyper_ui/service/service_loading/loading_service.dart';
import '../view/profile_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hyper_ui/service/service_profile/profile_service.dart';

class ProfileController extends State<ProfileView> {
  static late ProfileController instance;
  late ProfileView view;

  @override
  void initState() {
    instance = this;
    getProfile();
    getLoading();
    getDumping();
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

  List<dynamic> loading = [];
  getLoading() async {
    loading = await LoadingService().get();
    setState(() {});
  }

  List<dynamic> hauling = [];
  getHauling() async {
    hauling = await HaulingService().get();
    setState(() {});
  }

  List<dynamic> dumping = [];
  getDumping() async {
    dumping = await DumpingService().get();
    setState(() {});
  }
}
