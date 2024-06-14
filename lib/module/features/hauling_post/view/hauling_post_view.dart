import 'package:SiPandu/shared/widget/form/signature/signature.dart';
import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';
import 'package:SiPandu/widget/dropdown_item.dart';
import '../controller/hauling_post_controller.dart';

class HaulingPostView extends StatefulWidget {
  final Map? item;
  const HaulingPostView({Key? key, this.item}) : super(key: key);

  Widget build(context, HaulingPostController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hauling Post"),
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
                          items: location_hauling.items,
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
                          value: controller.nama_mitra,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Untuk menyelaraskan header ke kiri
                      children: [
                        // Menambahkan Header
                        Text(
                          "Lebar Jalan",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Minimal 20% atau 3,5 kali lebar unit terbesar yang melintasi",
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
                          value: controller.kode_1,
                          onChanged: (value, label) {
                            controller.kode_1 = value;
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Untuk menyelaraskan header ke kiri
                      children: [
                        // Menambahkan Header
                        Text(
                          "Grade Jalan",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Kurang dari 8% (batas maksimal 8-10%)",
                        ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Untuk menyelaraskan header ke kiri
                      children: [
                        // Menambahkan Header
                        Text(
                          "Surface Jalan",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Dilakukan pengerasan (Jalan Hauling)",
                        ),
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
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Dilakukan pemeliharaan surface jalan (Rata, Tidak bergelombang) & Bebas dari batuan lepas",
                        ),
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
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Setting Kemiringan jalan 2-3%",
                        ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Untuk menyelaraskan header ke kiri
                      children: [
                        // Menambahkan Header
                        Text(
                          "Tikungan",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Radius lebih dari 90°, rambu yang memadai harus terpasang",
                        ),
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
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Superelevasi memadi / tidak terbalik",
                        ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Untuk menyelaraskan header ke kiri
                      children: [
                        // Menambahkan Header
                        Text(
                          "Tanggul Pengaman",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Tinggi Tanggul 3/4 dari tinggi ban unit yang lewat pada kedua sisi jalan",
                        ),
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
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Posisi material diperkuat",
                        ),
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
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Terdapat open channel pada daerah titik tertentu",
                        ),
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
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "50 meter dari persimpangan, tanggul tidak menghalangi pandangan bagi sarana LV",
                        ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Untuk menyelaraskan header ke kiri
                      children: [
                        // Menambahkan Header
                        Text(
                          "Drainase",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Tersedia terbentuk drainase yang memadai",
                        ),
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
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Jalan didesign untuk kemudahan dalam pengalliran air (Kemiringan jalan/cross fall)",
                        ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Untuk menyelaraskan header ke kiri
                      children: [
                        // Menambahkan Header
                        Text(
                          "Guide Post",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Terpasang, per 40 meter mining road, 100 meter (Hauling Road)",
                        ),
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
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Terbuat dari bahan yang tidak mudah rusak yang dilengkapi dengan reflektor",
                        ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Untuk menyelaraskan header ke kiri
                      children: [
                        // Menambahkan Header
                        Text(
                          "Rambu lalulintas",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Terpasang Rambu lalu lintas yang memadai sesuai kondisi jalan",
                        ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Untuk menyelaraskan header ke kiri
                      children: [
                        // Menambahkan Header
                        Text(
                          "Rambu Informasi Lainnya",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Terpasang rambu informasi keselamatan lainnya (baliho,poster,dll)",
                        ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Untuk menyelaraskan header ke kiri
                      children: [
                        // Menambahkan Header
                        Text(
                          "Jembatan",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Rambu peringatan/ informasi terpasang dengan benar",
                        ),
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
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Mampu menahan beban unit yang akan melintas (kapasitas beban maksimum)",
                        ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Untuk menyelaraskan header ke kiri
                      children: [
                        // Menambahkan Header
                        Text(
                          "Median Jalan/devider",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Tersedia devider/middle isian dipersimpangan",
                        ),
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
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Dilengkapi dengan rambu petunjuk arah dan larang",
                        ),
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
                          value: controller.kode_21,
                          onChanged: (value, label) {
                            controller.kode_21 = value;
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Untuk menyelaraskan header ke kiri
                      children: [
                        // Menambahkan Header
                        Text(
                          "Simpang, pertemuan jalan",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Tegak lurus 90° T,tidak boleh lebih kecil dari 70°",
                        ),
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
                          value: controller.kode_22,
                          onChanged: (value, label) {
                            controller.kode_22 = value;
                          },
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Pandangan bebas/tidak blind spot",
                        ),
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
                          value: controller.kode_23,
                          onChanged: (value, label) {
                            controller.kode_23 = value;
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Untuk menyelaraskan header ke kiri
                      children: [
                        // Menambahkan Header
                        Text(
                          "Penerangan",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Dipasang pada titik critical (persimpangan, area crowded)",
                        ),
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
                          value: controller.kode_24,
                          onChanged: (value, label) {
                            controller.kode_24 = value;
                          },
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Jumlah lampu dan cahaya memadai",
                        ),
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
                          value: controller.kode_25,
                          onChanged: (value, label) {
                            controller.kode_25 = value;
                          },
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Dalam kondisi dan berfungsi baik",
                        ),
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
                          value: controller.kode_26,
                          onChanged: (value, label) {
                            controller.kode_26 = value;
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Untuk menyelaraskan header ke kiri
                      children: [
                        // Menambahkan Header
                        Text(
                          "Pengendalian debu",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Tersedia water truck dengan jumlah dan kapasitas memadai",
                        ),
                        SizedBox(height: 10),
                        QDropdownField(
                          label: "Kondisi Aktual",
                          validator: Validator.required,
                          items: KondisiAktual.items,
                          value: controller.kondisi_27,
                          onChanged: (value, label) {
                            controller.kondisi_27 = value;
                          },
                        ),
                        SizedBox(height: 10),
                        QDropdownField(
                          label: "Kode Bahaya",
                          items: KodeBahaya.items,
                          value: controller.kode_27,
                          onChanged: (value, label) {
                            controller.kode_27 = value;
                          },
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Dilakukan penyiraman pengendalian debu secara kontinyu",
                        ),
                        SizedBox(height: 10),
                        QDropdownField(
                          label: "Kondisi Aktual",
                          validator: Validator.required,
                          items: KondisiAktual.items,
                          value: controller.kondisi_28,
                          onChanged: (value, label) {
                            controller.kondisi_28 = value;
                          },
                        ),
                        SizedBox(height: 10),
                        QDropdownField(
                          label: "Kode Bahaya",
                          items: KodeBahaya.items,
                          value: controller.kode_28,
                          onChanged: (value, label) {
                            controller.kode_28 = value;
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Untuk menyelaraskan header ke kiri
                      children: [
                        // Menambahkan Header
                        Text(
                          "Waiting Line",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Dibuat sesuai dengan kebutuhan dijalan hauling",
                        ),
                        SizedBox(height: 10),
                        QDropdownField(
                          label: "Kondisi Aktual",
                          validator: Validator.required,
                          items: KondisiAktual.items,
                          value: controller.kondisi_29,
                          onChanged: (value, label) {
                            controller.kondisi_29 = value;
                          },
                        ),
                        SizedBox(height: 10),
                        QDropdownField(
                          label: "Kode Bahaya",
                          items: KodeBahaya.items,
                          value: controller.kode_29,
                          onChanged: (value, label) {
                            controller.kode_29 = value;
                          },
                        ),
                        Divider(), // Membuat garis pemisah antara header dan konten
                        SizedBox(height: 10), // Spasi antara header dan konten
                        Text(
                          "Dalam kondisi yang baik dan dilengkapi dengan rambu yang memadai",
                        ),
                        SizedBox(height: 10),
                        QDropdownField(
                          label: "Kondisi Aktual",
                          validator: Validator.required,
                          items: KondisiAktual.items,
                          value: controller.kondisi_30,
                          onChanged: (value, label) {
                            controller.kondisi_30 = value;
                          },
                        ),
                        SizedBox(height: 10),
                        QDropdownField(
                          label: "Kode Bahaya",
                          items: KodeBahaya.items,
                          value: controller.kode_30,
                          onChanged: (value, label) {
                            controller.kode_30 = value;
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
          controller.doSaveHauling();
        },
      ),
    );
  }

  @override
  State<HaulingPostView> createState() => HaulingPostController();
}
