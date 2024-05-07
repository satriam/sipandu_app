// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

class BasicTalkerPage extends StatefulWidget {
  final Talker talker;
  const BasicTalkerPage({
    Key? key,
    required this.talker,
  }) : super(key: key);

  @override
  State<BasicTalkerPage> createState() => _BasicTalkerPageState();
}

class _BasicTalkerPageState extends State<BasicTalkerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Talker Page"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
