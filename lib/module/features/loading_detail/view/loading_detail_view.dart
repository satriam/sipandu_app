import 'package:SiPandu/module/features/loading_detail/widget/Pdf/pdf_loading.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';
import 'package:shimmer/shimmer.dart';

class LoadingDetailView extends StatefulWidget {
  final Map? item;
  const LoadingDetailView({Key? key, this.item}) : super(key: key);

  Widget build(context, LoadingDetailController controller) {
    controller.view = this;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Loading Detail"),
          actions: [
            if (!controller.isLoading)
              IconButton(
                icon: const Icon(Icons.file_download),
                onPressed: () async {
                  await Get.to(PdfLoading(data: controller.Data));
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
                  ShimmerLoading2()
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
                                        "${controller.Data['attributes']?['nama_loading'] ?? ""}")
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
                              questions_loading[0],
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
                              questions_loading[1],
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
                              questions_loading[2],
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
                              questions_loading[3],
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
                              questions_loading[4],
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
                              questions_loading[5],
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
                              questions_loading[6],
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
                              questions_loading[7],
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
                              questions_loading[8],
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
                              questions_loading[9],
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
                            child: Text(questions_loading[10]),
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
                              questions_loading[11],
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
                              questions_loading[12],
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
                              questions_loading[13],
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
                              questions_loading[14],
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
                              questions_loading[15],
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
                              questions_loading[16],
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
                              questions_loading[17],
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
                              questions_loading[18],
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
                              questions_loading[19],
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
                              questions_loading[20],
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
                                        "${controller.Data['attributes']?['keterangan_21'] ?? "-"}"),
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
                              questions_loading[21],
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
                                        "${controller.Data['attributes']?['keterangan_22'] ?? "-"}"),
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
                              questions_loading[22],
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
                                        "${controller.Data['attributes']?['keterangan_23'] ?? "-"}"),
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
                              questions_loading[23],
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
                                        "${controller.Data['attributes']?['keterangan_24'] ?? "-"}"),
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
                              questions_loading[24],
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
                                        "${controller.Data['attributes']?['keterangan_25'] ?? "-"}"),
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
                              questions_loading[25],
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
                                        "${controller.Data['attributes']?['keterangan_26'] ?? "-"}"),
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
                        title: 'Tanda Tangan',
                        body: Column(
                          children: [
                            QSignature(
                              id: 'supervisor', // unique id for Pengawas Rehandling
                              label: 'Tanda Tangan Supervisor',
                              hint: 'Sign here',
                              helper: 'Jangan Lupa Untuk Menekan button save!',
                              onChanged: (value) {
                                controller.supervisor = value;
                              },
                              onSubmitted: (signature) async {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.success,
                                  animType: AnimType.rightSlide,
                                  headerAnimationLoop: true,
                                  title: "Berhasil!",
                                  desc: "Data Tanda tangan tersimpan!",
                                ).show();

                                // await showDialog<void>(
                                //   context: context,
                                //   barrierDismissible: true,
                                //   builder: (BuildContext context) {
                                //     return AlertDialog(
                                //       title: const Text('Berhasil!'),
                                //       content: const SingleChildScrollView(
                                //         child: ListBody(
                                //           children: <Widget>[
                                //             Text(
                                //                 'Berhasil Simpan tanda tangan Supervisor'),
                                //           ],
                                //         ),
                                //       ),
                                //       actions: <Widget>[
                                //         ElevatedButton(
                                //           style: ElevatedButton.styleFrom(
                                //             backgroundColor: Colors.blueGrey,
                                //           ),
                                //           onPressed: () {
                                //             Navigator.pop(context);
                                //           },
                                //           child: const Text("Ok"),
                                //         ),
                                //       ],
                                //     );
                                //   },
                                // );
                              },
                            ),
                          ],
                        ),
                        btnOkOnPress: () {
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
                          // print(controller.supervisor);
                          if (controller.pengawasrehandling == null) {
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
              ],
            ),
          ),
        )));
  }

  @override
  State<LoadingDetailView> createState() => LoadingDetailController();
}

class ShimmerLoading extends StatelessWidget {
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
