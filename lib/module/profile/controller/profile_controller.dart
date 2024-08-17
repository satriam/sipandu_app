import 'package:awesome_dialog/awesome_dialog.dart';
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
    RefreshTokenService().refreshToken();
    getNama();
    _initPackageInfo();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  Future<void> doLogout(BuildContext context) async {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      headerAnimationLoop: true,
      animType: AnimType.topSlide,
      title: 'Konfirmasi Logout',
      desc: 'Apakah Anda Yakin Ingin Logout?',
      btnOkOnPress: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('token');
        await prefs.remove('role');

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginView()),
          (Route<dynamic> route) => false,
        );
      },
      btnCancelOnPress: () {},
    ).show();
  }

  Map<String, dynamic> profile = {}; // Change the type to Map<String, dynamic>

  getProfile() async {
    try {
      dynamic profileData = await ProfileService()
          .get(); // Assuming ProfileService().get() returns dynamic
      if (profileData is Map<String, dynamic>) {
        profile = profileData;
        setState(() {});
      } else {
        // Handle the case where profileData is not in the expected format
        print("Profile data is not in the expected format.");
      }
    } catch (e) {
      return;
    }
  }

  Future<void> getNama() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id_user');
  }

  List<dynamic> loading = [];

  getLoading() async {
    try {
      loading = await LoadingService().get();
      setState(() {
        loading = loading.where((item) {
          return item['attributes']['id_user'] == userId;
        }).toList();
      });
    } catch (e) {
      return;
    }
  }

  List<dynamic> hauling = [];
  getHauling() async {
    try {
      hauling = await HaulingService().get();
      setState(() {
        hauling = hauling.where((item) {
          return item['attributes']['id_user'] == userId;
        }).toList();
      });
    } catch (e) {
      return;
    }
  }

  List<dynamic> dumping = [];
  getDumping() async {
    try {
      dumping = await DumpingService().get();
      setState(() {
        dumping = dumping.where((item) {
          return item['attributes']['id_user'] == userId;
        }).toList();
      });
    } catch (e) {
      return;
    }
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      version = info.version;
    });
  }
}
