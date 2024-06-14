import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';

class DashboardController extends State<DashboardView> {
  static late DashboardController instance;
  late DashboardView view;

  @override
  void initState() {
    instance = this;
    getProfile();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

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
}
