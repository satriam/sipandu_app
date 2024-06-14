import 'dart:typed_data';
import 'package:SiPandu/core.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> _fetchImage(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl));
  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('Failed to load image');
  }
}

Future<pw.Widget> buildSignLoading(Map<String, dynamic> data) async {
  final imageUrl = data['attributes']?['qr_1'] ?? "";
  final imageUrl2 = data['attributes']?['qr_2'] ?? "";
  final imageUrl3 = data['attributes']?['qr_3'] ??
      "${ApiUrl.baseUrl}/uploads/thumbnail_no_image_251fa67e50.jpg";
  final imageBytes = await _fetchImage(imageUrl);
  final imageBytes2 = await _fetchImage(imageUrl2);
  final imageBytes3 = await _fetchImage(imageUrl3);
  final image = pw.MemoryImage(imageBytes);
  final image2 = pw.MemoryImage(imageBytes2);
  final image3 = pw.MemoryImage(imageBytes3);
  return pw.Table(
    border: pw.TableBorder.all(),
    columnWidths: {
      0: pw.FixedColumnWidth(100),
      1: pw.FixedColumnWidth(100),
    },
    children: [
      pw.TableRow(
        children: [
          pw.Center(
            child: pw.Text(
              'Pengawas Mitra',
              style: pw.TextStyle(
                fontSize: 8,
              ),
            ),
          ),
          pw.Center(
            child: pw.Text(
              'Pengawas Rehandling',
              style: pw.TextStyle(
                fontSize: 8,
              ),
            ),
          ),
          pw.Center(
            child: pw.Text(
              'Supervisor Rehandling',
              style: pw.TextStyle(
                fontSize: 8,
              ),
            ),
          ),
        ],
      ),
      pw.TableRow(
        children: [
          pw.Center(
            child: pw.Image(
              image,
              height: 100,
              fit: pw.BoxFit.contain,
            ),
          ),
          pw.Center(
            child: pw.Image(
              image2,
              height: 100,
              fit: pw.BoxFit.contain,
            ),
          ),
          pw.Center(
            child: pw.Image(
              image3,
              height: 100,
              fit: pw.BoxFit.contain,
            ),
          ),
        ],
      ),
      pw.TableRow(
        children: [
          pw.Center(
            child: pw.Text(
              '${data['attributes']?['nama_pengawas_mitra'] ?? ""} ',
              style: pw.TextStyle(
                fontSize: 8,
              ),
            ),
          ),
          pw.Center(
            child: pw.Text(
              '${data['attributes']?['Pengawas_rh'] ?? ""} ',
              style: pw.TextStyle(
                fontSize: 8,
              ),
            ),
          ),
          pw.Center(
            child: pw.Text(
              '${data['attributes']?['nama_supervisor'] ?? ""}',
              style: pw.TextStyle(
                fontSize: 8,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
