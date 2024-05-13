import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/features/dumping_post/widget/dropdown_item.dart';
import '../controller/dumping_post_controller.dart';
import '../widget/dropdown_item.dart';

class DumpingPostView extends StatefulWidget {
  const DumpingPostView({Key? key}) : super(key: key);

  Widget build(context, DumpingPostController controller) {
    controller.view = this;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Dumping"),
          actions: [],
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  QAutoComplete(
                    label: "Nama Lokasi",
                    validator: Validator.required,
                    items: [
                      {
                        "label": "TAL",
                        "value": "TAL",
                      },
                      {
                        "label": "MTB",
                        "value": "MTB",
                      },
                      {
                        "label": "Banko",
                        "value": "Bank",
                      }
                    ],
                    value: null,
                    onChanged: (value, label) {},
                  ),
                  QAutoComplete(
                    label: "Nama Lokasi Detail",
                    validator: Validator.required,
                    items: Location_item.items,
                    value: null,
                    onChanged: (value, label) {},
                  ),
                ]))));
  }

  @override
  State<DumpingPostView> createState() => DumpingPostController();
}
