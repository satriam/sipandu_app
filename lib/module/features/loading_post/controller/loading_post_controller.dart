import 'package:SiPandu/core.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPostController extends State<LoadingPostView> {
  static late LoadingPostController instance;
  late LoadingPostView view;

  @override
  void initState() {
    instance = this;
    getid();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool get isEditMode => widget.item != null;
  String? buttonEdit = "Save";
  String? grup;
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
  String? keterangan_1;
  String? keterangan_2;
  String? keterangan_3;
  String? keterangan_4;
  String? keterangan_5;
  String? keterangan_6;
  String? keterangan_7;
  String? keterangan_8;
  String? keterangan_9;
  String? keterangan_10;
  String? keterangan_11;
  String? keterangan_12;
  String? keterangan_13;
  String? keterangan_14;
  String? keterangan_15;
  String? keterangan_16;
  String? keterangan_17;
  String? keterangan_18;
  String? keterangan_19;
  String? keterangan_20;
  String? keterangan_21;
  String? keterangan_22;
  String? keterangan_23;
  String? keterangan_24;
  String? keterangan_25;
  String? keterangan_26;
  String? evident_1;
  String? evident_2;
  String? ttd_pengawas_mitra;
  String? ttd_Pengawas_rh;
  int? id_user;

  getid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id_user = prefs.getInt('id_user');
    nama = prefs.getString('nama');
  }

  doSave() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    try {
      if (isEditMode) {
        await LoadingService().put(
            id: widget.item!["id"],
            shift: shift!,
            lokasi: lokasi!,
            lokasi_detail: lokasi_detail!,
            grup: grup!,
            nama_supervisor: nama_supervisor!,
            nama_pengawas: nama_mitra!,
            evident_1: evident_1,
            evident_2: evident_2,
            qr_1: ttd_pengawas_mitra,
            qr_2: ttd_Pengawas_rh);
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          headerAnimationLoop: false,
          animType: AnimType.topSlide,
          title: 'Berhasil',
          desc: 'Berhasil Update Data Loading',
          btnOkOnPress: () => Get.back(),
        ).show();

        // ScaffoldMessenger.of(context).showSnackBar(snackbar);
      } else {
        await LoadingService().post(
          shift: shift!,
          lokasi: lokasi!,
          lokasi_detail: lokasi_detail!,
          grup: grup!,
          nama_supervisor: nama_supervisor!,
          nama_pengawas: nama_mitra!,
          pengawas_rh: nama!,
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
          keterangan_1: keterangan_1,
          keterangan_2: keterangan_2,
          keterangan_3: keterangan_3,
          keterangan_4: keterangan_4,
          keterangan_5: keterangan_5,
          keterangan_6: keterangan_6,
          keterangan_7: keterangan_7,
          keterangan_8: keterangan_8,
          keterangan_9: keterangan_9,
          keterangan_10: keterangan_10,
          keterangan_11: keterangan_11,
          keterangan_12: keterangan_12,
          keterangan_13: keterangan_13,
          keterangan_14: keterangan_14,
          keterangan_15: keterangan_15,
          keterangan_16: keterangan_16,
          keterangan_17: keterangan_17,
          keterangan_18: keterangan_18,
          keterangan_19: keterangan_19,
          keterangan_20: keterangan_20,
          keterangan_21: keterangan_21,
          keterangan_22: keterangan_22,
          keterangan_23: keterangan_23,
          keterangan_24: keterangan_24,
          keterangan_25: keterangan_25,
          keterangan_26: keterangan_26,
          evident_1: evident_1,
          evident_2: evident_2,
          qr_1: ttd_pengawas_mitra,
          qr_2: ttd_Pengawas_rh,
          created_by_loading: id_user,
        );
        // final snackbar = SnackBar(content: Text('Berhasil Menyimpan'));
        // ScaffoldMessenger.of(context).showSnackBar(snackbar);

        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          headerAnimationLoop: false,
          animType: AnimType.topSlide,
          title: 'Berhasil',
          desc: 'Berhasil Menyimpan data Loading',
          btnOkOnPress: () => Get.back(),
        ).show();
      }
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
