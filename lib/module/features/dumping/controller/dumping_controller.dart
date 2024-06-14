import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:SiPandu/core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DumpingController extends State<DumpingView> {
  static late DumpingController instance;
  late DumpingView view;
  bool isLoading = true;
  int? userId;
  String? nama;
  String? role;
  List Dumping = [];

  @override
  void initState() {
    instance = this;
    getProfile();
    getNama();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  Future<void> getNama() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nama = prefs.getString('nama');
    role = prefs.getString('role');
    userId = prefs.getInt('id_user');
    // print(nama);
    await getProfile();
  }

  Future<void> getProfile() async {
    setState(() {
      isLoading = true; // Menampilkan efek shimmer
    });
    // await Future.delayed(Duration(seconds: 2));
    var allData = await DumpingService().get();
    // Loading = await LoadingService().get();

    setState(() {
      if (role == "Supervisor") {
        Dumping = allData.where((item) {
          return item['attributes']['nama_supervisor'] == nama;
        }).toList();
      } else {
        Dumping = allData.where((item) {
          return item['attributes']['id_user'] == userId;
        }).toList();
        // Menghentikan efek shimmer
      }
      isLoading = false;
    });
  }
}
