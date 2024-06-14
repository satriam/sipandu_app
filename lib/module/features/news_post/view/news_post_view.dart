import 'package:SiPandu/widget/dropdown_item.dart';
import 'package:SiPandu/shared/widget/form/signature/signature.dart';
import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';

class NewsPostView extends StatefulWidget {
  final Map? item;
  const NewsPostView({Key? key, this.item}) : super(key: key);

  Widget build(context, NewsPostController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("News Post"),
        actions: [],
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: controller.formKey,
                child: Column(children: [
                  QMemoField(
                    label: "Description",
                    validator: Validator.required,
                    value: null,
                    onChanged: (value) {
                      controller.test = value;
                    },
                  ),
                  QCheckField(
                    label: "News Type",
                    validator: Validator.atLeastOneitem,
                    items: [
                      {
                        "label": "Penting",
                        "value": 101,
                        "checked": false,
                      },
                      {
                        "label": "Info",
                        "value": 102,
                        "checked": false,
                      },
                      {
                        "label": "Rapat",
                        "value": 102,
                        "checked": false,
                      },
                      {
                        "label": "Hazard Report",
                        "value": 102,
                        "checked": false,
                      },
                      {
                        "label": "Safety Campign",
                        "value": 102,
                        "checked": false,
                      },
                    ],
                    onChanged: (values, ids) {},
                  ),
                  QImagePicker(
                    label: "Photo",
                    validator: Validator.required,
                    value: null,
                    onChanged: (value) {},
                  ),
                ]),
              ))),
      bottomNavigationBar: QActionButton(
        label: "Submit",
        onPressed: () {
          controller.dosave();
        },
      ),
    );
  }

  @override
  State<NewsPostView> createState() => NewsPostController();
}
