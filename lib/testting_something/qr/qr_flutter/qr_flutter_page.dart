// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:hyper_ui/testting_something/ui/textstyel.dart';

class QrFlutterPage extends StatelessWidget {
  final String data;
  const QrFlutterPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Qr Flutter Page"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Pertama Hasil Generate Text"),
              QrImageView(
                data: data,
                version: QrVersions.auto,
                size: 200.0,
              ),
              Divider(
                color: ColorConstant.black,
              ),
              QrImageView(
                data: '1234567890',
                version: QrVersions.auto,
                size: 200.0,
              ),
              const SizedBox(
                height: 24.0,
              ),
              QrImageView(
                data: 'This is a simple QR code',
                version: QrVersions.auto,
                size: 200,
                gapless: false,
              ),
              const SizedBox(
                height: 24.0,
              ),
              QrImageView(
                data: '''
{
  "nama": "John Doe",
  "usia": 30,
  "alamat": {
    "jalan": "Jl. Contoh",
    "kota": "Kota Contoh",
    "kode_pos": "12345"
  },
  "hobi": ["Membaca", "Bermain musik", "Olahraga"]
}

''',
                version: QrVersions.auto,
                size: 200,
                gapless: false,
                embeddedImage: AssetImage('assets/icon/google-logo.png'),
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: Size(40, 40),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              QrImageView(
                data: 'This QR code will',
                version: 1,
                size: 200,
                gapless: false,
                errorStateBuilder: (cxt, err) {
                  return Container(
                    child: Center(
                      child: Text(
                        'Uh oh! Something went wrong...',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
