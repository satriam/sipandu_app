import 'package:flutter/material.dart';
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
  String? grup;
  List Loading = [].obs;
  var filteredLoading = [].obs;
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
    setState(() {
      isLoading = true; // Menampilkan efek shimmer
    });

    try {
      bool isTokenValid = await NetworkController().checkTokenStatus();
      if (!isTokenValid) {
        return;
      }

      var allData = await LoadingService().get();

      if (mounted) {
        setState(() {
          if (role == "Supervisor") {
            Loading = allData.where((item) {
              return item['attributes']['grup'] == grup;
            }).toList();
          } else if (role == "Mitra") {
            Loading = allData.where((item) {
              return item['attributes']['id_user'] == userId;
            }).toList();
            print(Loading);
          } else {
            Loading = allData.where((item) {
              return item['attributes']['id_user'] == userId &&
                      item['attributes']['grup'] == grup ||
                  item['attributes']['status'] == "Waiting Approval Inspector";
            }).toList();
            // Menghentikan efek shimmer
          }
          filterLoading();
          isLoading = false;
        });
      }
    } catch (e) {}
  }

  void filterLoading() {
    if (selectedCategory.value.isEmpty) {
      filteredLoading.value = Loading;
    } else {
      filteredLoading.value = Loading.where((item) {
        var categoryMatches =
            item['attributes']['status'] == selectedCategory.value;

        return categoryMatches;
      }).toList();
    }
  }

  void updateCategory(String category) {
    selectedCategory.value = category;
    filterLoading();
  }
}
