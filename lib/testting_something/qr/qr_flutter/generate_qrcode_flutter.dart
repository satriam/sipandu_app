import 'package:flutter/material.dart';
import 'package:hyper_ui/testting_something/qr/qr_flutter/qr_flutter_page.dart';

class GenerateQRCodeFlutterPage extends StatelessWidget {
  GenerateQRCodeFlutterPage({super.key});

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GenerateQRCodeFlutterPage"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller,
            ),
            const SizedBox(
              height: 24.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QrFlutterPage(
                              data: controller.text,
                            )),
                  );
                },
                child: const Text("Genetate"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
