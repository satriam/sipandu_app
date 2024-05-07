// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ResultScanPage extends StatelessWidget {
  final String result;
  const ResultScanPage({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Result Scan Page"),
          actions: const [],
        ),
        body: Center(child: Text(result)));
  }
}
