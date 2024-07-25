import 'package:flutter/material.dart';
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
  String? grup;
  List Dumping = [].obs;
  var filteredDumping = [].obs;
  var selectedCategory = "".obs;

  @override
  void initState() {
    RefreshTokenService().refreshToken();
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
    grup = prefs.getString('grup');
    userId = prefs.getInt('id_user');
  }

  Future<void> getProfile() async {
    try {
      bool isTokenValid = await NetworkController().checkTokenStatus();
      if (!isTokenValid) {
        return;
      }
      setState(() {
        isLoading = true; // Menampilkan efek shimmer
      });

      var allData = await DumpingService().get();

      if (mounted) {
        setState(() {
          if (role == "Supervisor") {
            Dumping = allData.where((item) {
              return item['attributes']['grup'] == grup;
            }).toList();
          } else {
            Dumping = allData.where((item) {
              return item['attributes']['id_user'] == userId &&
                      item['attributes']['grup'] == grup ||
                  item['attributes']['status'] == "Waiting Approval Inspector";
            }).toList();
            // Menghentikan efek shimmer
          }
          filterDumping();
          isLoading = false;
        });
      }
    } catch (e) {
      return;
    }
  }

  void filterDumping() {
    if (selectedCategory.value.isEmpty) {
      filteredDumping.value = Dumping;
    } else {
      filteredDumping.value = Dumping.where((item) {
        var categoryMatches =
            item['attributes']['status'] == selectedCategory.value;

        return categoryMatches;
      }).toList();
    }
  }

  void updateCategory(String category) {
    selectedCategory.value = category;
    filterDumping();
  }
}
