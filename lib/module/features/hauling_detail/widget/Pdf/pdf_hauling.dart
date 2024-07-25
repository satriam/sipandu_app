import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:SiPandu/core.dart';

class PdfHauling extends StatefulWidget {
  final Map<String, dynamic> data;

  PdfHauling({this.data = const {}});
  @override
  _PdfHaulingState createState() => _PdfHaulingState();
}

class _PdfHaulingState extends State<PdfHauling> {
  final HaulingDetailController controller = HaulingDetailController();

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
        title: Text('PDF Hauling Road'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: PdfPreview(
        build: (format) =>
            _generatePdf(format, 'Checklist Inspeksi Hauling Road'),
        actions: [
          PdfPreviewAction(
            icon: Icon(Icons.save),
            onPressed: (context, build, pageFormat) async {
              final pdfBytes = await build(pageFormat);
              await saveAndLaunchFile(
                  pdfBytes, 'Checklist_Inspeksi_Hauling_Road.pdf');
            },
          ),
        ],
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document();
    final header = await buildHeaderHauling(widget.data);
    final content = await builContentHauling(widget.data);
    final sign = await buildSignHauling(widget.data);
    final lampiran = await buildLampiranHauling(widget.data);
    final Indicator = await indicatorHauling();

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
