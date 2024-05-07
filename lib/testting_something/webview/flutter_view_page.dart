import 'package:flutter/material.dart';
import 'package:hyper_ui/testting_something/webview/web_view_page.dart';

class FlutterViewPage extends StatelessWidget {
  const FlutterViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WebViewPage()),
                  );
                },
                child: const Text("Web View"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
