import 'dart:io';
import 'dart:typed_data';
import 'package:SiPandu/module/features/dumping_detail/widget/Pdf/indicator.dart';
import 'package:SiPandu/module/features/dumping_detail/widget/Pdf/lampiran.dart';
import 'package:SiPandu/module/features/dumping_detail/widget/Pdf/sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:SiPandu/core.dart';
import 'package:http/http.dart' as http;
import 'header.dart';
import 'content.dart';

class PdfDumping extends StatefulWidget {
  final Map<String, dynamic> data;

  PdfDumping({this.data = const {}});
  @override
  _PdfDumpingState createState() => _PdfDumpingState();
}

class _PdfDumpingState extends State<PdfDumping> {
  final DumpingDetailController controller = DumpingDetailController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Dumping Point'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: PdfPreview(
        build: (format) =>
            _generatePdf(format, 'Checklist Inspeksi Dumping Point'),
        actions: [
          PdfPreviewAction(
            icon: Icon(Icons.save),
            onPressed: (context, build, pageFormat) async {
              final pdfBytes = await build(pageFormat);
              await saveAndLaunchFile(
                  pdfBytes, 'Checklist_Inspeksi_Dumping_Point.pdf');
            },
          ),
        ],
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document();
    final header = await buildHeader(widget.data);
    final content = await builContent(widget.data);
    final sign = await buildSign(widget.data);
    final lampiran = await buildLampiran(widget.data);
    final Indicator = await indicator();

    pdf.addPage(pw.MultiPage(
      pageFormat: format,
      margin: pw.EdgeInsets.only(
        top: PdfPageFormat.cm,
        left: 2 * PdfPageFormat.cm,
        right: PdfPageFormat.cm,
      ),
      build: (context) => [
        header,
        pw.SizedBox(height: 5),
        Indicator,
        pw.SizedBox(height: 5),
        content,
        pw.SizedBox(height: 5),
        sign,
      ],
    ));
    pdf.addPage(pw.MultiPage(
      pageFormat: format,
      build: (context) => [lampiran],
    ));

    return pdf.save();
  }
}

Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/$fileName');
  await file.writeAsBytes(bytes, flush: true);
  OpenFile.open(file.path);
  print(file);
}
