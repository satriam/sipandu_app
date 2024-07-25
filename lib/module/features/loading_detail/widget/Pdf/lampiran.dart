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

Future<pw.Widget> buildLampiranLoading(Map<String, dynamic> data) async {
  var link =
      "https://sipandu-api.rehandling.my.id/uploads/no_image_b1d966e1bd.jpg";
  final imageUrl4 = data['attributes']?['evident_1'] ?? "$link";
  final imageUrl5 = data['attributes']?['evident_2'] ?? "$link";

  final imageBytes4 = await _fetchImage(imageUrl4);
  final imageBytes5 = await _fetchImage(imageUrl5);

  final image4 = pw.MemoryImage(imageBytes4);
  final image5 = pw.MemoryImage(imageBytes5);
  return pw.Column(children: [
    pw.Center(
      child: pw.Text(
        'LAMPIRAN',
        style: pw.TextStyle(
          fontSize: 14,
          fontWeight: pw.FontWeight.bold,
        ),
        textAlign: pw.TextAlign.center,
      ),
    ),
    pw.SizedBox(height: 5),
    pw.Table(
      columnWidths: {
        0: pw.FixedColumnWidth(150),
        1: pw.FixedColumnWidth(150),
      },
      children: [
        pw.TableRow(
          children: [
            pw.Center(
              child: pw.Image(
                image4,
                width: 300, // Specify the width
                height: 300,
                fit: pw.BoxFit.contain,
              ),
            ),
          ],
        ),
        pw.TableRow(children: [
          pw.Padding(
            padding: pw.EdgeInsets.all(5.0),
            child: pw.Text(
              '',
            ),
          ),
        ]),
        pw.TableRow(
          children: [
            pw.Center(
              child: pw.Image(
                image5,
                width: 300, // Specify the width
                height: 300,
                fit: pw.BoxFit.contain,
              ),
            ),
          ],
        ),
      ],
    ),
  ]);
}
