import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/features/dumping_post/view/dumping_post_view.dart';
import '../controller/dumping_controller.dart';

class DumpingView extends StatefulWidget {
  const DumpingView({Key? key}) : super(key: key);

  Widget build(context, DumpingController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dumping"),
        actions: [
          CircleAvatar(
            child: Text("${controller.Dumping.length}"),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: controller.Dumping.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = controller.Dumping[index];
          final evident = item['attributes']['evident_1'];
          final imageUrl = evident != null
              ? '${ApiUrl.baseUrl}${evident['data']['attributes']['formats']['thumbnail']['url']}'
              : '';

          return Card(
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  backgroundImage: NetworkImage(
                    imageUrl,
                  ),
                ),
                title: Text(item['attributes']['nama_dumping']),
                subtitle: Text(item['attributes']['tanggal'])),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Get.to(DumpingPostView());
        },
      ),
    );
  }

  @override
  State<DumpingView> createState() => DumpingController();
}
