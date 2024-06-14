import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<pw.Widget> indicator() async {
  return pw.Table(border: pw.TableBorder.all(), columnWidths: {
    0: pw.FixedColumnWidth(70),
    1: pw.FixedColumnWidth(80),
    2: pw.FixedColumnWidth(180),
    3: pw.FixedColumnWidth(130),
  }, children: [
    pw.TableRow(
      children: [
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
          child: pw.Text(
            'Kode Bahaya',
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
              fontSize: 10,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
          child: pw.Text(
            'Tingkat Bahaya',
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
              fontSize: 10,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
          child: pw.Text(
            'Kemungkinan Akibat',
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
              fontSize: 10,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
          child: pw.Text(
            'Tindakan yang Diperlukan',
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
              fontSize: 10,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    pw.TableRow(
      children: [
        pw.Container(
          color: PdfColors.red, // Example background color
          child: pw.Padding(
            padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
            child: pw.Text(
              'C',
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontSize: 8,
              ),
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
          child: pw.Text(
            'Critical',
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
              fontSize: 8,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
          child: pw.Text(
            "Kematian/PD Cost >US\$100",
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
              fontSize: 8,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
          child: pw.Text(
            'Stop Dan Perbaiki Segera',
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
              fontSize: 8,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    pw.TableRow(
      children: [
        pw.Container(
          color: PdfColors.orange, // Example background color
          child: pw.Padding(
            padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
            child: pw.Text(
              'H',
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontSize: 8,
              ),
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
          child: pw.Text(
            'High',
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
              fontSize: 8,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
          child: pw.Text(
            "LTI Serius/PD Cost US\$ 50.000-100.000",
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
              fontSize: 8,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
          child: pw.Text(
            'Perbaiki Dalam 12 Jam',
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
              fontSize: 8,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    pw.TableRow(
      children: [
        pw.Container(
          color: PdfColors.yellow, // Example background color
          child: pw.Padding(
            padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
            child: pw.Text(
              'M',
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontSize: 8,
              ),
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
          child: pw.Text(
            'Medium',
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
              fontSize: 8,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
          child: pw.Text(
            "Cedera Ringan/PD Cost US\$ 25.000-50.000",
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
              fontSize: 8,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
          child: pw.Text(
            'Perbaiki Dalam 3 Hari',
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
              fontSize: 8,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    pw.TableRow(
      children: [
        pw.Container(
          color: PdfColors.green, // Example background color
          child: pw.Padding(
            padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
            child: pw.Text(
              'L',
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontSize: 8,
              ),
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
          child: pw.Text(
            'Low',
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
              fontSize: 8,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
          child: pw.Text(
            "First Aid /PD Cost US\$ 5.000-25.000",
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
              fontSize: 8,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 1, bottom: 1, left: 8),
          child: pw.Text(
            'Perbaiki ,Tidak Prioritas',
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
              fontSize: 8,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  ]);
}
