import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsController extends State<NewsView> {
  static late NewsController instance;
  late NewsView view;
  bool isLoading = true;
  int? userId;
  String? nama;
  String? role;

  @override
  void initState() {
    instance = this;
    getNews();
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
    await getNews();
  }

  List Information = [];

  Future<void> getNews() async {
    setState(() {
      isLoading = true; // Menampilkan efek shimmer
    });
    await Future.delayed(Duration(seconds: 2));
    var response = await NewsService().get();
    if (response is Map<String, dynamic> && response.containsKey('data')) {
      List<dynamic> dataList = response['data'];
      Information = dataList
          .map((item) => item['attributes'] as Map<String, dynamic>)
          .toList();
    } else {
      // Handle the case where response is not in the expected format
      print("Response data is not in the expected format.");
    }
    setState(() {
      isLoading = false;
    });
  }
}
