import 'package:SiPandu/widget/dropdown_item.dart';
import 'package:SiPandu/shared/widget/form/signature/signature.dart';
import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';
import '../controller/dumping_post_controller.dart';

class DumpingPostView extends StatefulWidget {
  final Map? item;
  const DumpingPostView({Key? key, this.item}) : super(key: key);

  Widget build(context, DumpingPostController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dumping Post"),
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
                    child: Column(
                      children: [
                        QDropdownField(
                          label: "Grup",
                          validator: Validator.required,
                          items: [
                            {
                              "label": "Grup A",
                              "value": "Grup A",
                            },
                            {
                              "label": "Grup B",
                              "value": "Grup B",
                            },
                            {
                              "label": "Grup C",
                              "value": "Grup C",
                            },
                            {"label": "Grup D", "value": "Grup D"}
                          ],
                          value: controller.grup,
                          onChanged: (value, label) {
                            controller.grup = value;
                          },
                        ),
                        SizedBox(height: 10),
                        QDropdownField(
                          label: "Shift",
                          validator: Validator.required,
                          items: [
                            {
                              "label": "Shift 1",
                              "value": "Shift 1",
                            },
                            {
                              "label": "Shift 2",
                              "value": "Shift 2",
                            },
                            {
                              "label": "Shift 3",
                              "value": "Shift 3",
                            },
                          ],
                          value: controller.shift,
                          onChanged: (value, label) {
                            controller.shift = value;
                          },
                        ),
                        SizedBox(height: 10),
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
                              "value": "Bank",
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
                        SizedBox(height: 10), // Menambahkan jarak antar widget
                        QAutoComplete(
                          label: "Nama Supervisor",
                          validator: Validator.required,
                          items: Supervisor.items,
                          value: controller.nama_supervisor,
                          onChanged: (value, label) {
                            controller.nama_supervisor = value;
                          },
                        ),
                        SizedBox(height: 10),
                        QTextField(
                          label: "Nama Pengawas Mitra",
                          validator: Validator.required,
                          value: null,
                          onChanged: (value) {
                            controller.nama_mitra = value;
                          },
                        ),
                      ],
                    ),
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
                              "Apakah permukaan jalan dan dumpingan point rata dan bebas dari tumpahan material/ bolder yang berserakan"),
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
                            value: controller.kode_1,
                            onChanged: (value, label) {
                              controller.kode_1 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_1,
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
                              "Apakah Dimensi Lebar/Panjang dumpingan point sesuai dengan parameter"),
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
                            value: controller.kode_2,
                            onChanged: (value, label) {
                              controller.kode_2 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_2,
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
                              "Apakah patok survey sudah terpasang lengkap (toe, crest, boundry, dumping, dll)"),
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
                            value: controller.kode_3,
                            onChanged: (value, label) {
                              controller.kode_3 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_3,
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
                              "Apakah penempatan material sudah sesuai rencana/patok survey"),
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
                            value: controller.kode_4,
                            onChanged: (value, label) {
                              controller.kode_4 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_4,
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
                              "Apakah terdapat windraw/tanggul, acuan batasan dumping"),
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
                            value: controller.kode_5,
                            onChanged: (value, label) {
                              controller.kode_5 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_5,
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
                              "Apakah tersedia alat bantu buldozer untuk mendorong material"),
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
                            value: controller.kode_6,
                            onChanged: (value, label) {
                              controller.kode_6 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_6,
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
                              "Apakah tersedia alat bantu grader/dozer untuk merawat jalan di dumpingan area"),
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
                            value: controller.kode_7,
                            onChanged: (value, label) {
                              controller.kode_7 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_7,
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
                              "Tidak ada material dibuang diarea dumpingan plan"),
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
                            value: controller.kode_8,
                            onChanged: (value, label) {
                              controller.kode_8 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_8,
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
                          Text("Tidak ada material free dump"),
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
                            value: controller.kode_9,
                            onChanged: (value, label) {
                              controller.kode_9 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_9,
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
                              "Apakah area dumpingan bebas genangan air/ tempat kantung air"),
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
                            value: controller.kode_10,
                            onChanged: (value, label) {
                              controller.kode_10 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_10,
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
                              "Apakah di area dumpingan aman dari area longsor"),
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
                            value: controller.kode_11,
                            onChanged: (value, label) {
                              controller.kode_11 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_11,
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
                              "Apakah dilakukan pengendalian debu rutin diarea dumpingan"),
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
                            value: controller.kode_12,
                            onChanged: (value, label) {
                              controller.kode_12 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_12,
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
                              "Apakah area dumpingan aman dari jalur listrik/benda dari batas ketinggian"),
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
                            value: controller.kode_13,
                            onChanged: (value, label) {
                              controller.kode_13 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.kode_13,
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
                              "Apakah tersedia Rambu peringatan/informasi yang memadai"),
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
                            value: controller.kode_14,
                            onChanged: (value, label) {
                              controller.kode_14 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_14,
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
                              "Apakah penerangan memadai untuk operasi malam(NAB: 20 LUX)"),
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
                            value: controller.kode_15,
                            onChanged: (value, label) {
                              controller.kode_15 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_15,
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
                              "Apakah saluran air dibuat dan berfungsi dengan baik"),
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
                            value: controller.kode_16,
                            onChanged: (value, label) {
                              controller.kode_16 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_16,
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
                              "apakah tersedia area tempat berkumpul darurat Emergency Assembly Point"),
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
                            value: controller.kode_17,
                            onChanged: (value, label) {
                              controller.kode_17 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_17,
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
                              "Apakah jembatan hopper/stockpile tidak ada halang rintang dilalui"),
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
                            value: controller.kode_18,
                            onChanged: (value, label) {
                              controller.kode_18 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_18,
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
                          Text("Apakah Jembatan hopper ada trafficman"),
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
                            value: controller.kode_19,
                            onChanged: (value, label) {
                              controller.kode_19 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_19,
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
                              "Apakah Channel komunikasi sesuai dengan rambu perintah"),
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
                            value: controller.kode_20,
                            onChanged: (value, label) {
                              controller.kode_20 = value;
                            },
                          ),
                          SizedBox(height: 10),
                          QMemoField(
                            label: "Keterangan",
                            value: controller.keterangan_20,
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
                          QImagePicker(
                            label: "Photo",
                            validator: Validator.required,
                            value: controller.evident_1,
                            onChanged: (value) {
                              controller.evident_1 = value;
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
                          helper: 'Please provide your signature',
                          onChanged: (value) {
                            controller.ttd_pengawas_mitra = value;
                          },
                          onSubmitted: (signature) async {
                            await showDialog<void>(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Berhasil!'),
                                  content: const SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text(
                                            'Berhasil Simpan tanda tangan Pengawas Mitra'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueGrey,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Ok"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
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
                            await showDialog<void>(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Berhasil!'),
                                  content: const SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text(
                                            'Berhasil Simpan tanda tangan Pengawas Rehandling'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueGrey,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Ok"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            )),
      ),
      bottomNavigationBar: QActionButton(
        label: "Save",
        onPressed: () {
          controller.doSaveDumping();
        },
      ),
    );
  }

  @override
  State<DumpingPostView> createState() => DumpingPostController();
}
