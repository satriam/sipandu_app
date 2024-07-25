import 'dart:async';

import 'package:SiPandu/core.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HaulingPostController extends State<HaulingPostView> {
  static late HaulingPostController instance;
  late HaulingPostView view;

  String? role;
  late StreamSubscription<Map<String, String>> _streamSubscription;

  @override
  void initState() {
    instance = this;
    RefreshTokenService().refreshToken();
    // getid();
    _streamSubscription =
        ShiftSchedule().shiftStream.listen((data) => updateShiftData(data));
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool get isEditMode => widget.item != null;
  String? buttonEdit = "Save";
  String? grup;
  String? grupNow;
  String? shift;
  String? lokasi;
  String? lokasi_detail;
  String? nama_supervisor;
  String? nama_mitra;
  String? nama;
  String? kondisi_1 = "Aman";
  String? kondisi_2 = "Aman";
  String? kondisi_3 = "Aman";
  String? kondisi_4 = "Aman";
  String? kondisi_5 = "Aman";
  String? kondisi_6 = "Aman";
  String? kondisi_7 = "Aman";
  String? kondisi_8 = "Aman";
  String? kondisi_9 = "Aman";
  String? kondisi_10 = "Aman";
  String? kondisi_11 = "Aman";
  String? kondisi_12 = "Aman";
  String? kondisi_13 = "Aman";
  String? kondisi_14 = "Aman";
  String? kondisi_15 = "Aman";
  String? kondisi_16 = "Aman";
  String? kondisi_17 = "Aman";
  String? kondisi_18 = "Aman";
  String? kondisi_19 = "Aman";
  String? kondisi_20 = "Aman";
  String? kondisi_21 = "Aman";
  String? kondisi_22 = "Aman";
  String? kondisi_23 = "Aman";
  String? kondisi_24 = "Aman";
  String? kondisi_25 = "Aman";
  String? kondisi_26 = "Aman";
  String? kondisi_27 = "Aman";
  String? kondisi_28 = "Aman";
  String? kondisi_29 = "Aman";
  String? kondisi_30 = "Aman";
  String? kode_1;
  String? kode_2;
  String? kode_3;
  String? kode_4;
  String? kode_5;
  String? kode_6;
  String? kode_7;
  String? kode_8;
  String? kode_9;
  String? kode_10;
  String? kode_11;
  String? kode_12;
  String? kode_13;
  String? kode_14;
  String? kode_15;
  String? kode_16;
  String? kode_17;
  String? kode_18;
  String? kode_19;
  String? kode_20;
  String? kode_21;
  String? kode_22;
  String? kode_23;
  String? kode_24;
  String? kode_25;
  String? kode_26;
  String? kode_27;
  String? kode_28;
  String? kode_29;
  String? kode_30;
  String? status = "Waiting Approval Inspector";
  String? evident_1;
  String? evident_2;
  String? ttd_pengawas_mitra;
  String? ttd_Pengawas_rh;
  String? ttd_Supervisor;
  int? id_user;

  void updateShiftData(Map<String, String> data) {
    setState(() {
      grupNow = data['activeGroup'];
      shift = data['currentShift'];
    });
  }

  Future<void> fetchData() async {
    Map<String, dynamic> userData = await getid();
    setState(() {
      role = userData['role'];
      id_user = userData['id_user'];
      grup = userData['grup'];
      nama = userData['nama'];
    });
  }

  Future<Map<String, dynamic>> getid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? idUser = prefs.getInt('id_user');
    String? nama = prefs.getString('nama');
    String? role = prefs.getString('role');
    String? grup = prefs.getString('grup');

    return {
      'id_user': idUser,
      'nama': nama,
      'role': role,
      'grup': grup,
    };
  }

  doSaveHauling() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    try {
      if (role == "User") {
        await HaulingService().post(
            shift: shift!,
            lokasi: lokasi!,
            lokasi_detail: lokasi_detail!,
            grup: grup!,
            nama_supervisor: nama_supervisor,
            nama_pengawas: nama_mitra,
            pengawas_rh: nama,
            kondisi_1: kondisi_1!,
            kondisi_2: kondisi_2!,
            kondisi_3: kondisi_3!,
            kondisi_4: kondisi_4!,
            kondisi_5: kondisi_5!,
            kondisi_6: kondisi_6!,
            kondisi_7: kondisi_7!,
            kondisi_8: kondisi_8!,
            kondisi_9: kondisi_9!,
            kondisi_10: kondisi_10!,
            kondisi_11: kondisi_11!,
            kondisi_12: kondisi_12!,
            kondisi_13: kondisi_13!,
            kondisi_14: kondisi_14!,
            kondisi_15: kondisi_15!,
            kondisi_16: kondisi_16!,
            kondisi_17: kondisi_17!,
            kondisi_18: kondisi_18!,
            kondisi_19: kondisi_19!,
            kondisi_20: kondisi_20!,
            kondisi_21: kondisi_21!,
            kondisi_22: kondisi_22!,
            kondisi_23: kondisi_23!,
            kondisi_24: kondisi_24!,
            kondisi_25: kondisi_25!,
            kondisi_26: kondisi_26!,
            kondisi_27: kondisi_27!,
            kondisi_28: kondisi_28!,
            kondisi_29: kondisi_29!,
            kondisi_30: kondisi_30!,
            kode_1: kode_1,
            kode_2: kode_2,
            kode_3: kode_3,
            kode_4: kode_4,
            kode_5: kode_5,
            kode_6: kode_6,
            kode_7: kode_7,
            kode_8: kode_8,
            kode_9: kode_9,
            kode_10: kode_10,
            kode_11: kode_11,
            kode_12: kode_12,
            kode_13: kode_13,
            kode_14: kode_14,
            kode_15: kode_15,
            kode_16: kode_16,
            kode_17: kode_17,
            kode_18: kode_18,
            kode_19: kode_19,
            kode_20: kode_20,
            kode_21: kode_21,
            kode_22: kode_22,
            kode_23: kode_23,
            kode_24: kode_24,
            kode_25: kode_25,
            kode_26: kode_26,
            kode_27: kode_27,
            kode_28: kode_28,
            kode_29: kode_29,
            kode_30: kode_30,
            evident_1: evident_1,
            evident_2: evident_2,
            qr_1: ttd_pengawas_mitra,
            qr_2: ttd_Pengawas_rh,
            created_by_hauling: id_user,
            status: status = "Waiting Approval Supervisor");
      } else if (role == "Supervisor") {
        await HaulingService().post(
            shift: shift!,
            lokasi: lokasi!,
            lokasi_detail: lokasi_detail!,
            grup: grup!,
            nama_supervisor: nama,
            nama_pengawas: nama_mitra,
            kondisi_1: kondisi_1!,
            kondisi_2: kondisi_2!,
            kondisi_3: kondisi_3!,
            kondisi_4: kondisi_4!,
            kondisi_5: kondisi_5!,
            kondisi_6: kondisi_6!,
            kondisi_7: kondisi_7!,
            kondisi_8: kondisi_8!,
            kondisi_9: kondisi_9!,
            kondisi_10: kondisi_10!,
            kondisi_11: kondisi_11!,
            kondisi_12: kondisi_12!,
            kondisi_13: kondisi_13!,
            kondisi_14: kondisi_14!,
            kondisi_15: kondisi_15!,
            kondisi_16: kondisi_16!,
            kondisi_17: kondisi_17!,
            kondisi_18: kondisi_18!,
            kondisi_19: kondisi_19!,
            kondisi_20: kondisi_20!,
            kondisi_21: kondisi_21!,
            kondisi_22: kondisi_22!,
            kondisi_23: kondisi_23!,
            kondisi_24: kondisi_24!,
            kondisi_25: kondisi_25!,
            kondisi_26: kondisi_26!,
            kondisi_27: kondisi_27!,
            kondisi_28: kondisi_28!,
            kondisi_29: kondisi_29!,
            kondisi_30: kondisi_30!,
            kode_1: kode_1,
            kode_2: kode_2,
            kode_3: kode_3,
            kode_4: kode_4,
            kode_5: kode_5,
            kode_6: kode_6,
            kode_7: kode_7,
            kode_8: kode_8,
            kode_9: kode_9,
            kode_10: kode_10,
            kode_11: kode_11,
            kode_12: kode_12,
            kode_13: kode_13,
            kode_14: kode_14,
            kode_15: kode_15,
            kode_16: kode_16,
            kode_17: kode_17,
            kode_18: kode_18,
            kode_19: kode_19,
            kode_20: kode_20,
            kode_21: kode_21,
            kode_22: kode_22,
            kode_23: kode_23,
            kode_24: kode_24,
            kode_25: kode_25,
            kode_26: kode_26,
            kode_27: kode_27,
            kode_28: kode_28,
            kode_29: kode_29,
            kode_30: kode_30,
            evident_1: evident_1,
            qr_1: ttd_pengawas_mitra,
            created_by_hauling: id_user,
            status: status);
      } else {
        await HaulingService().post(
            shift: shift!,
            grup: grupNow!,
            lokasi: lokasi!,
            lokasi_detail: lokasi_detail!,
            nama_pengawas: nama,
            kondisi_1: kondisi_1!,
            kondisi_2: kondisi_2!,
            kondisi_3: kondisi_3!,
            kondisi_4: kondisi_4!,
            kondisi_5: kondisi_5!,
            kondisi_6: kondisi_6!,
            kondisi_7: kondisi_7!,
            kondisi_8: kondisi_8!,
            kondisi_9: kondisi_9!,
            kondisi_10: kondisi_10!,
            kondisi_11: kondisi_11!,
            kondisi_12: kondisi_12!,
            kondisi_13: kondisi_13!,
            kondisi_14: kondisi_14!,
            kondisi_15: kondisi_15!,
            kondisi_16: kondisi_16!,
            kondisi_17: kondisi_17!,
            kondisi_18: kondisi_18!,
            kondisi_19: kondisi_19!,
            kondisi_20: kondisi_20!,
            kondisi_21: kondisi_21!,
            kondisi_22: kondisi_22!,
            kondisi_23: kondisi_23!,
            kondisi_24: kondisi_24!,
            kondisi_25: kondisi_25!,
            kondisi_26: kondisi_26!,
            kondisi_27: kondisi_27!,
            kondisi_28: kondisi_28!,
            kondisi_29: kondisi_29!,
            kondisi_30: kondisi_30!,
            kode_1: kode_1,
            kode_2: kode_2,
            kode_3: kode_3,
            kode_4: kode_4,
            kode_5: kode_5,
            kode_6: kode_6,
            kode_7: kode_7,
            kode_8: kode_8,
            kode_9: kode_9,
            kode_10: kode_10,
            kode_11: kode_11,
            kode_12: kode_12,
            kode_13: kode_13,
            kode_14: kode_14,
            kode_15: kode_15,
            kode_16: kode_16,
            kode_17: kode_17,
            kode_18: kode_18,
            kode_19: kode_19,
            kode_20: kode_20,
            kode_21: kode_21,
            kode_22: kode_22,
            kode_23: kode_23,
            kode_24: kode_24,
            kode_25: kode_25,
            kode_26: kode_26,
            kode_27: kode_27,
            kode_28: kode_28,
            kode_29: kode_29,
            kode_30: kode_30,
            evident_1: evident_1,
            qr_1: ttd_pengawas_mitra,
            created_by_hauling: id_user,
            status: status);
      }

      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        headerAnimationLoop: false,
        animType: AnimType.topSlide,
        title: 'Berhasil',
        desc: 'Berhasil Menyimpan data Hauling',
        btnOkOnPress: () => Get.back(),
      ).show();
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        headerAnimationLoop: false,
        animType: AnimType.topSlide,
        title: 'Error',
        desc: 'Terjadi kesalahan: $e',
        btnOkOnPress: () => Get.back(),
      ).show();
    }
  }
}
