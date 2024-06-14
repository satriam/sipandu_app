import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DumpingDetailController extends State<DumpingDetailView> {
  static late DumpingDetailController instance;
  late DumpingDetailView view;
  int? id;
  bool isLoading = true;
  String? supervisor;
  String? role;
  @override
  void initState() {
    instance = this;
    id = widget.item?['id'] ?? 0;
    getData(id);
    fetchRole();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  Future<String?> getinfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? role = prefs.getString('role');

    return role;
  }

  Future<void> fetchRole() async {
    String? fetchedRole = await getinfo();
    setState(() {
      role = fetchedRole;
    });
  }

  getData(id) async {
    setState(() {
      isLoading = true; // Menampilkan efek shimmer
    });
    await Future.delayed(Duration(seconds: 2));

    dynamic DumpingData = await DumpingService()
        .get_one(id); // Assuming ProfileService().get() returns dynamic
    if (DumpingData is Map<String, dynamic>) {
      Data = DumpingData;
      // print(Data['attributes']['grup']);
      setState(() {
        isLoading = false;
      });
    } else {
      // Handle the case where profileData is not in the expected format
      print("Profile data is not in the expected format.");
    }
  }

  Map<String, dynamic> Data = {}; // Change the type to Map<String, dynamic>

  doUpdate() async {
    await DumpingService().put_qr_3(id: widget.item!["id"], qr_3: supervisor);
    snackbarIconSuccess(message: "Berhasil Update Data");
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
