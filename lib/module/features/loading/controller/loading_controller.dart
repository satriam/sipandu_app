import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:SiPandu/core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingController extends State<LoadingView> {
  static late LoadingController instance;
  late LoadingView view;
  bool isLoading = true;
  int? userId;
  String? nama;
  String? role;

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
    // await getProfile();
  }

  List Loading = [];

  Future<void> getProfile() async {
    setState(() {
      isLoading = true; // Menampilkan efek shimmer
    });
    // await Future.delayed(Duration(seconds: 10));
    var allData = await LoadingService().get();
    // Loading = await LoadingService().get();

    setState(() {
      if (role == "Supervisor") {
        Loading = allData.where((item) {
          return item['attributes']['nama_supervisor'] == nama;
        }).toList();
      } else {
        Loading = allData.where((item) {
          return item['attributes']['id_user'] == userId;
        }).toList();
        // Menghentikan efek shimmer
      }
      isLoading = false;
    });
  }
}
