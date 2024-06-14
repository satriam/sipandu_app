import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HaulingController extends State<HaulingView> {
  static late HaulingController instance;
  late HaulingView view;
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
    print(nama);
    await getProfile();
  }

  List Hauling = [];

  Future<void> getProfile() async {
    setState(() {
      isLoading = true; // Menampilkan efek shimmer
    });
    // await Future.delayed(Duration(seconds: 2));
    var allData = await HaulingService().get();
    // Loading = await LoadingService().get();

    setState(() {
      if (role == "Supervisor") {
        Hauling = allData.where((item) {
          return item['attributes']['nama_supervisor'] == nama;
        }).toList();
      } else {
        Hauling = allData.where((item) {
          return item['attributes']['id_user'] == userId;
        }).toList();
        // Menghentikan efek shimmer
      }
      isLoading = false;
    });
  }
}
