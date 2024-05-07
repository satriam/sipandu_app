import 'package:flutter/material.dart';
import '../controller/hauling_controller.dart';
import 'package:hyper_ui/core.dart';
import 'package:get/get.dart';

class HaulingView extends StatelessWidget {
  const HaulingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HaulingController>(
      init: HaulingController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Hauling"),
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
