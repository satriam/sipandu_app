import 'package:SiPandu/module/features/dumping_detail/widget/Pdf/pdf_dumping.dart';
import 'package:SiPandu/module/features/dumping_detail/widget/shimmer_dumping1.dart';
import 'package:SiPandu/widget/soal_item.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';

class DumpingDetailView extends StatefulWidget {
  final Map? item;
  const DumpingDetailView({Key? key, this.item}) : super(key: key);

  Widget build(context, DumpingDetailController controller) {
    controller.view = this;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Dumping Detail"),
          actions: [
            IconButton(
              icon: const Icon(Icons.file_download),
              onPressed: () async {
                await Get.to(PdfDumping(data: controller.Data));
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
                  ShimmerDumping2()
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
                                "${ApiUrl.baseUrl}/uploads/thumbnail_no_image_251fa67e50.jpg",
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
                                        "${controller.Data['attributes']?['nama_dumping'] ?? ""}")
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[0],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_1'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[1],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_2'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[2],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_3'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[3],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_4'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[4],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_5'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[5],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_6'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[6],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_7'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[7],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_8'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[8],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_9'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[9],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_10'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(questions_dumping[10]),
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_11'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[11],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_12'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[12],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_13'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[13],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_14'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[14],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_15'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[15],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_16'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[16],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_17'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[17],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_18'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[18],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_19'] ?? "-"}"),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions_dumping[19],
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Keterangan'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(':'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${controller.Data['attributes']?['keterangan_20'] ?? "-"}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (controller.role.toString() == "User")
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
                                          "${ApiUrl.baseUrl}/uploads/thumbnail_no_image_251fa67e50.jpg",
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      controller.Data['attributes']?['qr_3'] ??
                                          "${ApiUrl.baseUrl}/uploads/thumbnail_no_image_251fa67e50.jpg",
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
                else if (controller.Data['attributes']?['qr_3'] == null)
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
                          }
                        },
                      ).show();
                    },
                  ),
              ],
            ),
          ),
        )));
  }

  @override
  State<DumpingDetailView> createState() => DumpingDetailController();
}

class ShimmerDumping extends StatelessWidget {
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
