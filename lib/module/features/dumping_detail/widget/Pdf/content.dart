import 'package:SiPandu/core.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<pw.Widget> builContent(Map<String, dynamic> data) async {
  final logo = pw.MemoryImage(
    (await rootBundle.load('assets/images/logo-ptba.png')).buffer.asUint8List(),
  );

  return pw.Table(
    border: pw.TableBorder.all(),
    columnWidths: {
      0: pw.FixedColumnWidth(18),
      1: pw.FixedColumnWidth(145),
      2: pw.FixedColumnWidth(35),
      3: pw.FixedColumnWidth(35),
      4: pw.FixedColumnWidth(50),
    },
    children: [
      pw.TableRow(
        children: [
          pw.Padding(
            padding: pw.EdgeInsets.only(top: 8, bottom: 1, left: 8),
            child: pw.Text('No',
                style:
                    pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.only(top: 8, bottom: 1, left: 8),
            child: pw.Text('Hal Untuk Diperiksa',
                textAlign: pw.TextAlign.center,
                style:
                    pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
            child: pw.Center(
                child: pw.Text('Kondisi Actual',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                        fontSize: 10, fontWeight: pw.FontWeight.bold))),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
            child: pw.Center(
                child: pw.Text('Kode Bahaya',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold,
                    ))),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.only(top: 8, bottom: 1, left: 8),
            child: pw.Center(
                child: pw.Text('Keterangan',
                    style: pw.TextStyle(
                        fontSize: 10, fontWeight: pw.FontWeight.bold))),
          ),
        ],
      ),
      for (int i = 0; i < questions_dumping.length; i++)
        pw.TableRow(
          children: [
            pw.Padding(
              padding: pw.EdgeInsets.all(1.0),
              child: pw.Text('${i + 1}',
                  textAlign: pw.TextAlign.center,
                  style: pw.TextStyle(fontSize: 8)),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(1.0),
              child: pw.Text(questions_dumping[i],
                  textAlign: pw.TextAlign.left,
                  style: pw.TextStyle(fontSize: 8)),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(1.0),
              child: pw.Text(
                  "${data['attributes']?['Kondisi_${i + 1}'] ?? "-"}",
                  textAlign: pw.TextAlign.center,
                  style: pw.TextStyle(fontSize: 8)),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(1.0),
              child: pw.Text("${data['attributes']?['kode_${i + 1}'] ?? "-"}",
                  textAlign: pw.TextAlign.center,
                  style: pw.TextStyle(fontSize: 8)),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(1.0),
              child: pw.Text(
                  "${data['attributes']?['keterangan_${i + 1}'] ?? "-"}",
                  textAlign: pw.TextAlign.center,
                  style: pw.TextStyle(fontSize: 8)),
            ),
          ],
        ),
    ],
  );
}
