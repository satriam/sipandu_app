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
  String? grup;
  List Hauling = [].obs;
  var filteredHauling = [].obs;
  var selectedCategory = "".obs;

  @override
  void initState() {
    instance = this;
    RefreshTokenService().refreshToken();
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
    grup = prefs.getString('grup');
    userId = prefs.getInt('id_user');
  }

  Future<void> getProfile() async {
    bool isTokenValid = await NetworkController().checkTokenStatus();
    if (!isTokenValid) {
      return;
    }
    try {
      setState(() {
        isLoading = true; // Menampilkan efek shimmer
      });

      var allData = await HaulingService().get();

      if (mounted) {
        setState(() {
          if (role == "Supervisor") {
            Hauling = allData.where((item) {
              return item['attributes']['grup'] == grup;
            }).toList();
          } else {
            Hauling = allData.where((item) {
              return item['attributes']['id_user'] == userId &&
                      item['attributes']['grup'] == grup ||
                  item['attributes']['status'] == "Waiting Approval Inspector";
            }).toList();
            // Menghentikan efek shimmer
          }
          filterHauling();
          isLoading = false;
        });
      }
    } catch (e) {
      return;
    }
  }

  void filterHauling() {
    if (selectedCategory.value.isEmpty) {
      filteredHauling.value = Hauling;
    } else {
      filteredHauling.value = Hauling.where((item) {
        var categoryMatches =
            item['attributes']['status'] == selectedCategory.value;

        return categoryMatches;
      }).toList();
    }
  }

  void updateCategory(String category) {
    selectedCategory.value = category;
    filterHauling();
  }
}
