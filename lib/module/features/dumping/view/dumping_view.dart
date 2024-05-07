import 'package:flutter/material.dart';
import '../controller/dumping_controller.dart';
import 'package:hyper_ui/core.dart';
import 'package:get/get.dart';

class DumpingView extends StatelessWidget {
  const DumpingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DumpingController>(
      init: DumpingController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              // Add your onPressed functionality here
            },
          ),
          appBar: AppBar(
            title: const Text("Dumping"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: const [],
              ),
            ),
          ),
        );
      },
    );
  }
}
