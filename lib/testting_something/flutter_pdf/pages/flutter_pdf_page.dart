import 'dart:developer';
import 'package:hyper_ui/testting_something/flutter_pdf/service/permission.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:hyper_ui/testting_something/flutter_pdf/model/customer_model.dart';
import 'package:hyper_ui/testting_something/flutter_pdf/model/invoice_model.dart';
import 'package:hyper_ui/testting_something/flutter_pdf/model/supplier_model.dart';
import 'package:hyper_ui/testting_something/flutter_pdf/service/helper_invoice.dart';
import 'package:hyper_ui/testting_something/flutter_pdf/service/helper_pdf_service.dart';
import 'package:permission_handler/permission_handler.dart';

class FlutterPdfPage extends StatefulWidget {
  const FlutterPdfPage({super.key});

  @override
  State<FlutterPdfPage> createState() => _FlutterPdfPageState();
}

class _FlutterPdfPageState extends State<FlutterPdfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter PDF Page"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.picture_as_pdf_outlined,
                size: 80,
              ),
            ),
            const SizedBox(
              height: 14.0,
            ),
            Center(
              child: Text(
                "Generate PDF",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 48),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () async {
                  final status = await checkPermission();
                  if (status.isGranted) {
                    log("Running: Invoice PDF");
                    final date = DateTime.now();
                    final dueDate = date.add(Duration(days: 7));

                    final invoice = InvoiceModel(
                      supplier: SupplierModel(
                        name: 'Sarah Field',
                        address: 'Sarah Street 9, Beijing, China',
                        paymentInfo: 'https://paypal.me/sarahfieldzz',
                      ),
                      customer: CustomerModel(
                        name: 'Apple Inc.',
                        address: 'Apple Street, Cupertino, CA 95014',
                      ),
                      info: InvoiceInfoModel(
                        date: date,
                        dueDate: dueDate,
                        description: 'My description...',
                        number: '${DateTime.now().year}-9999',
                      ),
                      items: [
                        InvoiceItem(
                          description: 'Coffee',
                          date: DateTime.now(),
                          quantity: 3,
                          vat: 0.19,
                          unitPrice: 5.99,
                        ),
                        InvoiceItem(
                          description: 'Water',
                          date: DateTime.now(),
                          quantity: 8,
                          vat: 0.19,
                          unitPrice: 0.99,
                        ),
                        InvoiceItem(
                          description: 'Orange',
                          date: DateTime.now(),
                          quantity: 3,
                          vat: 0.19,
                          unitPrice: 2.99,
                        ),
                        InvoiceItem(
                          description: 'Apple',
                          date: DateTime.now(),
                          quantity: 8,
                          vat: 0.19,
                          unitPrice: 3.99,
                        ),
                        InvoiceItem(
                          description: 'Mango',
                          date: DateTime.now(),
                          quantity: 1,
                          vat: 0.19,
                          unitPrice: 1.59,
                        ),
                        InvoiceItem(
                          description: 'Blue Berries',
                          date: DateTime.now(),
                          quantity: 5,
                          vat: 0.19,
                          unitPrice: 0.99,
                        ),
                        InvoiceItem(
                          description: 'Lemon',
                          date: DateTime.now(),
                          quantity: 4,
                          vat: 0.19,
                          unitPrice: 1.29,
                        ),
                      ],
                    );

                    final pdfFile = await HelperInvoice.generate(invoice);
                    log("pdfFile: $pdfFile");
                    HelperPdfService.openFile(pdfFile);
                  }
                  // // final pdf = pw.Document();

                  // // pdf.addPage(pw.Page(
                  // //     pageFormat: PdfPageFormat.a4,
                  // //     build: (pw.Context context) {
                  // //       return pw.Center(
                  // //         child: pw.Text("Hello World"),
                  // //       ); // Center
                  // //     })); // Page
                },
                child: const Text("Invoice PDF"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
