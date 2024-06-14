import 'package:SiPandu/core.dart';
import 'package:pdf/widgets.dart' as pw;

Future<pw.Widget> builContentHauling(Map<String, dynamic> data) async {
  return pw.Table(
    border: pw.TableBorder.all(),
    columnWidths: {
      0: pw.FixedColumnWidth(18),
      1: pw.FixedColumnWidth(40),
      2: pw.FixedColumnWidth(145),
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
            child: pw.Text('Item Periksa',
                textAlign: pw.TextAlign.center,
                style:
                    pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.only(top: 8, bottom: 1, left: 8),
            child: pw.Text('Parameters',
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
        ],
      ),
      for (int i = 0; i < questions_hauling.length; i++)
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
              child: pw.Text(item_hauling[i],
                  textAlign: pw.TextAlign.left,
                  style: pw.TextStyle(fontSize: 8)),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(1.0),
              child: pw.Text(questions_hauling[i],
                  textAlign: pw.TextAlign.left,
                  style: pw.TextStyle(fontSize: 8)),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(1.0),
              child: pw.Text("${data['attributes']?['Kondisi_${i + 1}'] ?? ""}",
                  textAlign: pw.TextAlign.center,
                  style: pw.TextStyle(fontSize: 8)),
            ),
          ],
        ),
    ],
  );
}
