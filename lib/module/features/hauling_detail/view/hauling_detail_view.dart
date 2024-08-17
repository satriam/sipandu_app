import 'package:SiPandu/module/features/hauling_detail/widget/Pdf/pdf_hauling.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';
import 'package:shimmer/shimmer.dart';

class HaulingDetailView extends StatefulWidget {
  final Map? item;
  const HaulingDetailView({Key? key, this.item}) : super(key: key);

  Widget build(context, HaulingDetailController controller) {
    controller.view = this;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Hauling Detail"),
          actions: [
            if (!controller.isLoading)
              IconButton(
                icon: const Icon(Icons.file_download),
                onPressed: () async {
                  await Get.to(PdfHauling(data: controller.Data));
                },
              ),
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
          key: controller.formKey,
          padding: const EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              children: [
                if (controller.isLoading)
                  ShimmerHauling2()
                else
                  Card(
                    elevation: 4,
                    child: Container(
                      // Tambahkan padding di dalam Card
                      padding: const EdgeInsets.all(10.0),

                      child: Row(
                        children: [
                          // Menampilkan Image.network jika gambar sudah dimuat
                          Image.network(
                            controller.Data['attributes']?['evident_1'] ??
                                "https://sipandu-api.rehandling.my.id/uploads/no_image_b1d966e1bd.jpg",
                            width: 150,
                            height: 150,
                          ),
                          SizedBox(width: 10),
                          // Jarak antara gambar dan teks
                          // Kolom berisi beberapa baris teks di sebelah kanan
                          Expanded(
                            child: Table(
                              columnWidths: {
                                0: FlexColumnWidth(2),
                                1: IntrinsicColumnWidth(),
                                2: FlexColumnWidth(2),
                              },
                              children: [
                                TableRow(
                                  children: [
                                    Text(
                                      'Grup',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(':'),
                                    Text(
                                      "${controller.Data['attributes']?['grup'] ?? ""}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    SizedBox(height: 8), // Padding antara baris
                                    SizedBox(height: 8),
                                    SizedBox(height: 8),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text('Shift'),
                                    Text(':'),
                                    Text(
                                        "${controller.Data['attributes']?['shift'] ?? ""}"),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    SizedBox(height: 8), // Padding antara baris
                                    SizedBox(height: 8),
                                    SizedBox(height: 8),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text('Tanggal'),
                                    Text(':'),
                                    Text(
                                        "${controller.Data['attributes']?['tanggal'] ?? ""}"),
                                    // "${controller.Data['attributes']['tanggal']}"),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    SizedBox(height: 8), // Padding antara baris
                                    SizedBox(height: 8),
                                    SizedBox(height: 8),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text('Lokasi'),
                                    Text(':'),
                                    Text(
                                        "${controller.Data['attributes']?['lokasi'] ?? ""}")
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    SizedBox(height: 8), // Padding antara baris
                                    SizedBox(height: 8),
                                    SizedBox(height: 8),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text('Detail Lokasi'),
                                    Text(':'),
                                    Text(
                                        "${controller.Data['attributes']?['nama_hauling'] ?? ""}")
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    SizedBox(height: 8), // Padding antara baris
                                    SizedBox(height: 8),
                                    SizedBox(height: 8),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text('Pengawas Mitra'),
                                    Text(':'),
                                    Text(
                                        "${controller.Data['attributes']?['nama_pengawas_mitra'] ?? ""}"),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    SizedBox(height: 8), // Padding antara baris
                                    SizedBox(height: 8),
                                    SizedBox(height: 8),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text('Supervisor'),
                                    Text(':'),
                                    Text(
                                        "${controller.Data['attributes']?['nama_supervisor'] ?? ""}"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.isLoading)
                  ShimmerLoading()
                else
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Lebar Jalan",
                              style: TextStyle(
                                fontWeight: bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[0],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "${controller.Data['attributes']?['Kondisi_1'] ?? ""}")),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_1'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.isLoading)
                  ShimmerLoading()
                else
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Grade Jalan",
                              style: TextStyle(
                                fontWeight: bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[1],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_2'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_2'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.isLoading)
                  ShimmerLoading()
                else
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Surface Jalan",
                              style: TextStyle(
                                fontWeight: bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[2],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_3'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_3'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[3],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_4'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_4'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[4],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_5'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_5'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.isLoading)
                  ShimmerLoading()
                else
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Tikungan",
                              style: TextStyle(
                                fontWeight: bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[5],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_6'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_6'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[6],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_7'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_7'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.isLoading)
                  ShimmerLoading()
                else
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Tanggul pengaman",
                              style: TextStyle(
                                fontWeight: bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[7],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_8'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_8'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[8],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_9'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_9'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[9],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_10'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_10'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(questions_hauling[10],
                                style: TextStyle(fontWeight: bold)),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_11'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_11'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.isLoading)
                  ShimmerLoading()
                else
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Drainase",
                              style: TextStyle(
                                fontWeight: bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[11],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_12'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_12'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[12],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_13'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_13'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.isLoading)
                  ShimmerLoading()
                else
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Guide Post",
                              style: TextStyle(
                                fontWeight: bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[13],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_14'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_14'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[14],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_15'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_15'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.isLoading)
                  ShimmerLoading()
                else
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Rambu Lalulintas",
                              style: TextStyle(
                                fontWeight: bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[15],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_16'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_16'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.isLoading)
                  ShimmerLoading()
                else
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Rambu Informasi Lainnya",
                              style: TextStyle(
                                fontWeight: bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[16],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_17'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_17'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.isLoading)
                  ShimmerLoading()
                else
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Jembatan",
                              style: TextStyle(
                                fontWeight: bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[17],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_18'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_18'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[18],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_19'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_19'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.isLoading)
                  ShimmerLoading()
                else
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Median Jalan/Devider",
                              style: TextStyle(
                                fontWeight: bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[19],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_20'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_20'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[20],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_21'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_21'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.isLoading)
                  ShimmerLoading()
                else
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Simpang, Pertemuan Jalan",
                              style: TextStyle(
                                fontWeight: bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[21],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_22'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_22'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[22],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_23'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_23'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.isLoading)
                  ShimmerLoading()
                else
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Penerangan",
                              style: TextStyle(
                                fontWeight: bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[23],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_24'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_24'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[24],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_25'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_25'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[25],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_26'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_26'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.isLoading)
                  ShimmerLoading()
                else
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Pengendalian Debu",
                              style: TextStyle(
                                fontWeight: bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[26],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_27'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_27'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[27],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_28'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_28'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.isLoading)
                  ShimmerLoading()
                else
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Waiting Line",
                              style: TextStyle(
                                fontWeight: bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[28],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_29'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_29'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_hauling[29],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kondisi Aktual'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['Kondisi_30'] ?? "-"}"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Kode Bahaya'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['kode_30'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.role.toString() == "User" ||
                    controller.role.toString() == "Mitra")
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Table(
                            border: TableBorder
                                .all(), // Optional: Adds a border to the table
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Pengawas Mitra'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Supervisor"),
                                  ),
                                ],
                              ),
                              // Tambahkan lebih banyak TableRow sesuai kebutuhan

                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      controller.Data['attributes']?['qr_1'] ??
                                          "https://sipandu-api.rehandling.my.id/uploads/no_image_b1d966e1bd.jpg",
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      controller.Data['attributes']?['qr_3'] ??
                                          "https://sipandu-api.rehandling.my.id/uploads/no_image_b1d966e1bd.jpg",
                                      width: 100,
                                      height: 100,
                                    ),
                                  )
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['nama_pengawas_mitra'] ?? "-"}"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['nama_supervisor'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                else if (controller.role.toString() == "Supervisor" &&
                    controller.Data['attributes']?['qr_2'] != null)
                  AnimatedButton(
                    text: 'Accept Report',
                    color: successColor,
                    pressEvent: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.noHeader,
                        animType: AnimType.rightSlide,
                        headerAnimationLoop: true,
                        title: 'Question',
                        body: Column(
                          children: [
                            QSignature(
                              id: 'supervisor', // unique id for Pengawas Rehandling
                              label: 'Tanda Tangan Supervisor',
                              hint: 'Sign here',
                              helper: 'Please provide your signature',
                              onChanged: (value) {
                                controller.supervisor = value;
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
                                                'Berhasil Simpan tanda tangan Supervisor'),
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
                        btnOkOnPress: () {
                          print(controller.supervisor);
                          if (controller.supervisor == null) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              headerAnimationLoop: true,
                              title: "Gagal Simpan!",
                              desc: "Data Kosong",
                              btnCancelOnPress: () {},
                            ).show();
                          } else {
                            controller.doUpdate();
                            controller.getData(controller.id);
                          }
                        },
                      ).show();
                    },
                  ),
                if (controller.role.toString() == "User" &&
                    controller.Data['attributes']?['qr_2'] == null)
                  AnimatedButton(
                      text: 'Accept from pengawas rehandling',
                      color: successColor,
                      pressEvent: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.noHeader,
                          animType: AnimType.rightSlide,
                          headerAnimationLoop: true,
                          title: 'Question',
                          dismissOnBackKeyPress: false,
                          dismissOnTouchOutside: false,
                          body: Column(
                            children: [
                              QSignature(
                                id: 'Pengawas', // unique id for Pengawas Rehandling
                                label: 'Tanda Tangan Pengawas Rehandling',
                                hint: 'Sign here',
                                helper: 'Please provide your signature',
                                onChanged: (value) {
                                  controller.pengawasrehandling = value;
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
                              )
                            ],
                          ),
                          btnOkOnPress: () {
                            if (controller.pengawasrehandling == null) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                headerAnimationLoop: true,
                                title: "Gagal Simpan!",
                                desc: "Data Kosong",
                              ).show();
                            } else {
                              controller.doUpdate();
                              controller.getData(controller.id);
                            }
                          },
                        ).show();
                      }),
              ],
            ),
          ),
        )));
  }

  @override
  State<HaulingDetailView> createState() => HaulingDetailController();
}

class ShimmerHauling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 16.0,
                  color: Colors.white,
                ),
              ),
              Table(
                border: TableBorder.all(),
                columnWidths: {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(2),
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
