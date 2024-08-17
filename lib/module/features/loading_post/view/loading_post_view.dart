import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';

class LoadingPostView extends StatefulWidget {
  final Map? item;
  const LoadingPostView({Key? key, this.item}) : super(key: key);

  Widget build(context, LoadingPostController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading Post"),
        actions: [],
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: controller.formKey,
                child: Column(children: [
                  Card(
                    // Membungkus dengan Card
                    elevation: 2,
                    child: Container(
                      // Tambahkan padding di dalam Card
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: [
                        QDropdownField(
                          label: "Lokasi",
                          validator: Validator.required,
                          items: [
                            {
                              "label": "TAL",
                              "value": "TAL",
                            },
                            {
                              "label": "MTB",
                              "value": "MTB",
                            },
                            {
                              "label": "Banko",
                              "value": "Banko",
                            },
                            {
                              "label": "FOB MV",
                              "value": "FOB MV",
                            }
                          ],
                          value: controller.lokasi,
                          onChanged: (value, label) {
                            controller.lokasi = value;
                          },
                        ),
                        SizedBox(height: 10), // Menambahkan jarak antar widget
                        QAutoComplete(
                          label: "Nama Lokasi Detail",
                          validator: Validator.required,
                          items: Location_item.items,
                          value: controller.lokasi_detail,
                          onChanged: (value, label) {
                            controller.lokasi_detail = value;
                          },
                        ),

                        SizedBox(height: 10),
                        if (controller.role.toString() == "User" ||
                            controller.role.toString() == "Supervisor")
                          QAutoComplete(
                            label: "Nama Pengawas Mitra",
                            validator: Validator.required,
                            items: PengawasMitra.items,
                            value: null,
                            onChanged: (value, label) {
                              controller.nama_mitra = value;
                            },
                          ),
                      ]),
                    ),
                  ),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                              "Apakah lebar loading point sesuai dengan parameter hingga pergerakan manuver dump truck aman sesuai jenis dump truck",
                              style: TextStyle(fontSize: 17, fontWeight: bold),
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_1,
                              onChanged: (value, label) {
                                controller.kondisi_1 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_1 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_1 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah permukaan loading point rata dan bebas dari tumpahan material berserakan?",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_2,
                              onChanged: (value, label) {
                                controller.kondisi_2 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_2 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_2 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah grade jalan atau rambu menuju loading sesuai parameter <8%",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_3,
                              onChanged: (value, label) {
                                controller.kondisi_3 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_3 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_3 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah ada alat support buldozer untuk membersihkan loading point",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_4,
                              onChanged: (value, label) {
                                controller.kondisi_4 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_4 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_4 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah patok survey sudah terpasang lengkap sebagai acuan",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_5,
                              onChanged: (value, label) {
                                controller.kondisi_5 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_5 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_5 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah penggalian sudah sesuai desain atau patok survey acuan kerja",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_6,
                              onChanged: (value, label) {
                                controller.kondisi_6 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_6 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_6 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah pada lokasi kerja aman dari potensi longsor dan material menggantung",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_7,
                              onChanged: (value, label) {
                                controller.kondisi_7 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_7 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_7 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah cukup penerangan untuk operasi malam hari (NAB : 20LUX)",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_8,
                              onChanged: (value, label) {
                                controller.kondisi_8 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_8 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_8 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah material siap diloading (Sudah diblasing, dripping, cukup lunak untuk digali dimuat) dan cukup untuk pada shift ini",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_9,
                              onChanged: (value, label) {
                                controller.kondisi_9 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_9 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_9 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah saluran air yang diluar atau didalam areal tambang berfungsi dengan baik ?",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_10,
                              onChanged: (value, label) {
                                controller.kondisi_10 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_10 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_10 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah saluran air disepanjang jalan angkut, jika ada, apakah berfungsi dengan baik",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_11,
                              onChanged: (value, label) {
                                controller.kondisi_11 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_11 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_11 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah pada permukaan loading point bebas dari genangan air dan terbebas dari cekungan potensi untuk terjadinya kantung air",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_12,
                              onChanged: (value, label) {
                                controller.kondisi_12 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_12 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_12 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah gorong-gorong(jika ada) cukup untuk debit air yang lewat",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_13,
                              onChanged: (value, label) {
                                controller.kondisi_13 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_13 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_13 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah tinggi loading point sesuai parameter (sesuai denga hauler)",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_14,
                              onChanged: (value, label) {
                                controller.kondisi_14 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_14 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_14 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah terdapat rambu/peringatan terpasang dengan jumlah memadai",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_15,
                              onChanged: (value, label) {
                                controller.kondisi_15 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_15 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_15 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah jalan tidak digunakan lagi atau jalan yang terdapat beda tinggi telah diberikade atau diblok",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_16,
                              onChanged: (value, label) {
                                controller.kondisi_16 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_16 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_16 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah alat yang digunakan memiliki stiker commisioning masih berlaku",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_17,
                              onChanged: (value, label) {
                                controller.kondisi_17 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_17 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_17 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah semua aliran air diarahkan menuju sump",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_18,
                              onChanged: (value, label) {
                                controller.kondisi_18 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_18 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_18 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah areal ekspose batubara menjadi daerah terbatas dan minimalkan kontaminasi",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_19,
                              onChanged: (value, label) {
                                controller.kondisi_19 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_19 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_19 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah towerlamp diletakkan pada tempat yang aman dan aktifitas alat berat",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_20,
                              onChanged: (value, label) {
                                controller.kondisi_20 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_20 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_20 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah parkir kendaraan sarana aman dari manuver alat berat, radius putar dan lintasan kerja alat berat minimal 30 meter",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_21,
                              onChanged: (value, label) {
                                controller.kondisi_21 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_21 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_21 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah sampah terkelola dengan baik, tidak berserakan diarea front loading",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_22,
                              onChanged: (value, label) {
                                controller.kondisi_22 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_22 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_22 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah semua peralatan telah dilengkapi radio komunikasi",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_23,
                              onChanged: (value, label) {
                                controller.kondisi_23 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_23 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_23 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Tersedia area berkumpul dalam keadaan darurat atau Emergency Assembly Point",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_24,
                              onChanged: (value, label) {
                                controller.kondisi_24 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_24 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_24 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah Unit Loading tersedia (Excavator/Loader) untuk loading muat material",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_25,
                              onChanged: (value, label) {
                                controller.kondisi_25 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_25 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_25 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                                "Apakah adanya pernyiraman saat area loading berdebu oleh unit water truck",
                                style:
                                    TextStyle(fontSize: 17, fontWeight: bold)),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kondisi Aktual",
                              validator: Validator.required,
                              items: KondisiAktual.items,
                              value: controller.kondisi_26,
                              onChanged: (value, label) {
                                controller.kondisi_26 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QDropdownField(
                              label: "Kode Bahaya",
                              items: KodeBahaya.items,
                              value: "",
                              onChanged: (value, label) {
                                controller.kode_26 = value;
                              },
                            ),
                            SizedBox(height: 10),
                            QMemoField(
                              label: "Keterangan",
                              value: null,
                              onChanged: (value) {
                                controller.keterangan_26 = value;
                              },
                            ),
                          ]))),
                  Card(
                      // Membungkus dengan Card
                      elevation: 2,
                      child: Container(
                          // Tambahkan padding di dalam Card
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            QImagePicker(
                              label: "Photo Grid",
                              validator: Validator.required,
                              value: controller.evident_1,
                              onChanged: (value) {
                                controller.evident_1 = value;
                              },
                            ),
                          ]))),
                  if (controller.role.toString() == "User")
                    Card(
                        // Membungkus dengan Card
                        elevation: 2,
                        child: Container(
                            // Tambahkan padding di dalam Card
                            padding: const EdgeInsets.all(10.0),
                            child: Column(children: [
                              QImagePicker(
                                label: "Photo",
                                validator: Validator.required,
                                value: controller.evident_2,
                                onChanged: (value) {
                                  controller.evident_2 = value;
                                },
                              ),
                            ]))),
                  Card(
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          QSignature(
                            id: 'pengawas_mitra', // unique id for Pengawas Mitra
                            label: 'Tanda Tangan Pengawas Mitra',
                            hint: 'Sign here',
                            helper:
                                'Pastikan Pengawas Mitra Ada Di Lapangan!\nJangan Lupa untuk Menekan Save!',
                            onChanged: (value) {
                              controller.ttd_pengawas_mitra = value;
                            },
                            onSubmitted: (signature) async {
                              showSuccesDialog(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (controller.role.toString() == "User")
                    Card(
                      elevation: 5,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            QSignature(
                              id: 'pengawas_rehandling', // unique id for Pengawas Rehandling
                              label: 'Tanda Tangan Pengawas Rehandling',
                              hint: 'Sign here',
                              helper: 'Please provide your signature',
                              onChanged: (value) {
                                controller.ttd_Pengawas_rh = value;
                              },
                              onSubmitted: (signature) async {
                                showSuccesDialog(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (controller.role.toString() == "Supervisor")
                    Card(
                      elevation: 5,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            QSignature(
                              id: 'supervisor_rehandling', // unique id for Pengawas Rehandling
                              label: 'Tanda Tangan Supervisor',
                              hint: 'Sign here',
                              helper: 'Please provide your signature',
                              onChanged: (value) {
                                controller.ttd_Supervisor = value;
                              },
                              onSubmitted: (signature) async {
                                showSuccesDialog(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(height: 10),
                ]),
              ))),
      bottomNavigationBar: QActionButton(
        label: controller.buttonEdit.toString(),
        onPressed: () {
          switch (controller.role) {
            case 'User':
              if (controller.ttd_Pengawas_rh == null ||
                  controller.ttd_pengawas_mitra == null) {
                showErrorDialog(context);
              } else {
                controller.doSave();
              }
              break;
            case 'Mitra':
              if (controller.ttd_pengawas_mitra == null) {
                showErrorDialog(context);
              } else {
                controller.doSave();
              }
              break;

            case 'Supervisor':
              if (controller.ttd_pengawas_mitra == null ||
                  controller.ttd_Supervisor == null) {
                showErrorDialog(context);
              } else {
                controller.doSave();
              }
            // Add more cases as needed
            default:
              print("Role kosong");
              break;
          }
          // controller.doSaveDumping();
        },
      ),
    );
  }

  void showErrorDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      headerAnimationLoop: true,
      title: "Gagal Simpan!",
      desc: "Cek Kembali data",
    ).show();
  }

  void showSuccesDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      headerAnimationLoop: true,
      title: "Berhasil!",
      desc: "Data Tanda tangan tersimpan!",
    ).show();
  }

  @override
  State<LoadingPostView> createState() => LoadingPostController();
}
