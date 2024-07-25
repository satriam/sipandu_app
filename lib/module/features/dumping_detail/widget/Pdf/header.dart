import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;

Future<pw.Widget> buildHeader(Map<String, dynamic> data) async {
  final logo = pw.MemoryImage(
    (await rootBundle.load('assets/images/logo-ptba.png')).buffer.asUint8List(),
  );

  return pw.Column(
    children: [
      pw.Table(
        border: pw.TableBorder.all(),
        columnWidths: {
          0: pw.FixedColumnWidth(150),
          2: pw.FixedColumnWidth(80),
          3: pw.FixedColumnWidth(150),
        },
        children: [
          pw.TableRow(
            children: [
              pw.Center(
                child: pw.Image(
                  logo,
                  fit: pw.BoxFit.contain,
                ),
              ),
              pw.Center(
                child: pw.Text(
                  'CHECKLIST INSPEKSI DUMPING POINT',
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'No. Dok.',
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    'No. Revisi',
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    'Halaman',
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    ':',
                    style: pw.TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    ':',
                    style: pw.TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    ':',
                    style: pw.TextStyle(
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      pw.SizedBox(height: 10), // Add space between tables
      pw.Table(
        border: pw.TableBorder.all(),
        columnWidths: {
          0: pw.FixedColumnWidth(100),
          1: pw.FixedColumnWidth(100),
        },
        children: [
          pw.TableRow(
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
                child: pw.Text(
                  'Aktivitas:  Coal Rehandling',
                  textAlign: pw.TextAlign.left,
                  style: pw.TextStyle(
                    fontSize: 8,
                  ),
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
                child: pw.Text(
                  'Dumping Point: ${data['attributes']?['nama_dumping'] ?? ""} ',
                  textAlign: pw.TextAlign.left,
                  style: pw.TextStyle(
                    fontSize: 8,
                  ),
                ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
                child: pw.Text(
                  'Lokasi kerja:  ${data['attributes']?['lokasi'] ?? ""} ',
                  textAlign: pw.TextAlign.left,
                  style: pw.TextStyle(
                    fontSize: 8,
                  ),
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
                child: pw.Text(
                  'Shift: ${data['attributes']?['shift'] ?? ""}/${data['attributes']?['grup'] ?? ""}',
                  textAlign: pw.TextAlign.left,
                  style: pw.TextStyle(
                    fontSize: 8,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
