import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// final Uri _url = Uri.parse('tel:+6281225339246');
final Uri _url = Uri.parse('https://wa.me/6281225339246');
String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

final Uri smsLaunchUri = Uri(
  scheme: 'sms',
  path: '081225339246',
  queryParameters: <String, String>{
    'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
  },
);
final Uri emailLaunchUri = Uri(
  scheme: 'mailto',
  path: 'smith@example.com',
  query: encodeQueryParameters(<String, String>{
    'subject': 'Example Subject & Symbols are allowed!',
  }),
);

class UrlLauncherPage extends StatefulWidget {
  UrlLauncherPage({super.key});

  @override
  State<UrlLauncherPage> createState() => _UrlLauncherPageState();
}

class _UrlLauncherPageState extends State<UrlLauncherPage> {
  Future<void> _launchUrl() async {
    if (!await launchUrl(
      // _url,
      emailLaunchUri,
      // smsLaunchUri,
    )) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Url Launcher Page"),
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
                onPressed: _launchUrl,
                child: const Text("Launch URL"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
