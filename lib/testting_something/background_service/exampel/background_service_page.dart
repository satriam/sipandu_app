import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class BackgroundServicePage extends StatefulWidget {
  const BackgroundServicePage({super.key});

  @override
  State<BackgroundServicePage> createState() => _BackgroundServicePageState();
}

class _BackgroundServicePageState extends State<BackgroundServicePage> {
  late Timer timer;
  String value = "";

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      try {
        var path = await getTemporaryDirectory();
        final File file = File('${path.path}/data.txt');
        value = file.readAsStringSync();
        setState(() {});
      } on Exception catch (err) {
        log(err.toString());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Background Service Page"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "value:\n${value} :c",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
