import 'dart:async';

import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  static late DashboardController instance;
  late DashboardView view;
  final refreshTokenService = RefreshTokenService();
  // late AnimationController animationController;
  String? activeGroup;
  String? currentShift;
  String? currentDate;
  int? userId;
  String? role;
  String? nama;
  late StreamSubscription<Map<String, String>> _streamSubscription;

  @override
  void initState() {
    super.initState();
    RefreshTokenService().refreshToken();

    instance = this;
    _streamSubscription =
        ShiftSchedule().shiftStream.listen((data) => updateShiftData(data));
    getProfile();
    getLoading();
    getNama();
    getAll();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  void updateShiftData(Map<String, String> data) {
    setState(() {
      activeGroup = data['activeGroup'];
      currentShift = data['currentShift'];
      currentDate = data['currentDate'];
    });
  }

  Map<String, dynamic> profile = {};

  getProfile() async {
    await NetworkController().checkTokenStatus();
    try {
      dynamic profileData = await ProfileService().get();
      if (profileData is Map<String, dynamic>) {
        profile = profileData;
        setState(() {});
      } else {
        print("Profile data is not in the expected format.");
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> getNama() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id_user');
    role = prefs.getString('role');
    nama = prefs.getString('nama');
    print(userId);
  }

  List<dynamic> loading = [];

  getLoading() async {
    await NetworkController().checkTokenStatus();
    try {
      loading = await LoadingService().get();

      setState(() {
        loading = loading.where((item) {
          // Get today's date
          DateTime now = DateTime.now();
          String formattedDate = DateFormat('yyyy-MM-dd').format(now);

          // print(formattedDate);
          // Filter condition: date equals today and id_user equals userId
          return item['attributes']['tanggal'] == formattedDate &&
              item['attributes']['id_user'] == userId;
        }).toList();
        // print(loading);
      });
    } catch (e) {
      return null;
    }
  }

  List<dynamic> dumping = [];
  getDumping() async {
    await NetworkController().checkTokenStatus();
    try {
      dumping = await DumpingService().get();

      setState(() {
        dumping = dumping.where((item) {
          // Get today's date
          DateTime now = DateTime.now();
          String formattedDate = DateFormat('yyyy-MM-dd').format(now);

          // Filter condition: date equals today and id_user equals userId
          return item['attributes']['tanggal'] == formattedDate &&
              item['attributes']['id_user'] == userId;
        }).toList();
      });
    } catch (e) {
      return null;
    }
  }

  List<dynamic> hauling = [];
  getHauling() async {
    await NetworkController().checkTokenStatus();
    try {
      hauling = await HaulingService().get();

      setState(() {
        hauling = hauling.where((item) {
          // Get today's date
          DateTime now = DateTime.now();
          String formattedDate = DateFormat('yyyy-MM-dd').format(now);

          // Filter condition: date equals today and id_user equals userId
          return item['attributes']['tanggal'] == formattedDate &&
              item['attributes']['id_user'] == userId;
        }).toList();
      });
    } catch (e) {
      return null;
    }
  }

  int total = 0;
  List<dynamic> haulings = [];
  List<dynamic> loadings = [];
  List<dynamic> dumpings = [];
  getAll() async {
    await NetworkController().checkTokenStatus();
    try {
      var haulings = await HaulingService().get();
      var loadings = await LoadingService().get();
      var dumpings = await DumpingService().get();
      setState(() {
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('yyyy-MM-dd').format(now);

        haulings = haulings.where((item) {
          DateTime itemDate = DateTime.parse(item['attributes']['updatedAt']);
          String itemFormattedDate = DateFormat('yyyy-MM-dd').format(itemDate);

          return itemFormattedDate == formattedDate &&
              ((role == 'Supervisor' &&
                      item['attributes']['qr_3'] != null &&
                      item['attributes']['nama_supervisor'] == nama) ||
                  (role == 'User' &&
                      item['attributes']['qr_2'] != null &&
                      item['attributes']['nama_supervisor'] == nama));
        }).toList();

        loadings = loadings.where((item) {
          DateTime itemDate = DateTime.parse(item['attributes']['updatedAt']);
          String itemFormattedDate = DateFormat('yyyy-MM-dd').format(itemDate);
          return itemFormattedDate == formattedDate &&
              ((role == 'Supervisor' &&
                      item['attributes']['qr_3'] != null &&
                      item['attributes']['nama_supervisor'] == nama) ||
                  (role == 'User' &&
                      item['attributes']['qr_2'] != null &&
                      item['attributes']['nama_supervisor'] == nama));
        }).toList();
        dumpings = dumpings.where((item) {
          DateTime itemDate = DateTime.parse(item['attributes']['updatedAt']);
          String itemFormattedDate = DateFormat('yyyy-MM-dd').format(itemDate);
          return itemFormattedDate == formattedDate &&
              ((role == 'Supervisor' &&
                      item['attributes']['qr_3'] != null &&
                      item['attributes']['nama_supervisor'] == nama) ||
                  (role == 'User' &&
                      item['attributes']['qr_2'] != null &&
                      item['attributes']['nama_supervisor'] == nama));
        }).toList();

        int totalPoints = haulings.length + loadings.length + dumpings.length;
        print(totalPoints);

        setState(() {
          this.total = totalPoints;
        });
      });
    } catch (e) {
      return null;
    }
  }
}
