import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DumpingDetailController extends State<DumpingDetailView> {
  static late DumpingDetailController instance;
  late DumpingDetailView view;
  var isPengawasAktif = false.obs;

  int? id;
  bool isLoading = true;
  String? supervisor;
  String? pengawasrehandling;
  String? namaPengawasRehandling;
  String? role;
  String? id_user;
  String? grup;
  String? nama;
  @override
  void initState() {
    RefreshTokenService().refreshToken();
    instance = this;
    id = widget.item?['id'] ?? 0;
    getData(id);
    fetchData();

    super.initState();
  }

  @override
  void dispose() => super.dispose();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> fetchData() async {
    Map<String, dynamic> userData = await getid();
    setState(() {
      role = userData['role'];
      grup = userData['grup'];
      nama = userData['nama'];
    });
  }

  Future<Map<String, dynamic>> getid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? nama = prefs.getString('nama');
    String? role = prefs.getString('role');
    String? grup = prefs.getString('grup');

    return {
      'nama': nama,
      'role': role,
      'grup': grup,
    };
  }

  getData(id) async {
    try {
      bool isTokenValid = await NetworkController().checkTokenStatus();
      if (!isTokenValid) {
        return;
      }
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
    } catch (e) {
      return;
    }
  }

  Map<String, dynamic> Data = {}; // Change the type to Map<String, dynamic>

  doUpdate() async {
    try {
      if (role == "User") {
        if (Data['attributes']['qr_3'] != null) {
          await DumpingService().put_pengawas(
              id: widget.item!["id"],
              qr_2: pengawasrehandling,
              pengawas_rh: nama,
              status: "Complete");
          snackbarIconSuccess(message: "Berhasil Update Data");
        } else {
          await DumpingService().put_pengawas(
              id: widget.item!["id"],
              qr_2: pengawasrehandling,
              pengawas_rh: nama,
              status: "Waiting Approval Supervisor");
          snackbarIconSuccess(message: "Berhasil Update Data");
        }
      } else if (role == "Supervisor") {
        await DumpingService().put_spv(
            id: widget.item!["id"],
            qr_3: supervisor,
            nama_supervisor: nama,
            status: "Complete");
        snackbarIconSuccess(message: "Berhasil Update Data");
      }
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
