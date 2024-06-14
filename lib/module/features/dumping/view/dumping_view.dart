import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:SiPandu/core.dart';

class DumpingView extends StatefulWidget {
  const DumpingView({Key? key}) : super(key: key);

  Widget build(context, DumpingController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(title: const Text("Dumping"), actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () async {
            await controller.getProfile();
          },
        ),
      ]),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getProfile();
        },
        child: controller.isLoading
            ? ListView.builder(
                itemCount: 5, // Jumlah item untuk efek shimmer
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ShimmerDumpingListItem();
                },
              )
            : controller.Dumping.isEmpty
                ? Center(
                    child: Lottie.asset('assets/animation/notfoundata.json'),
                  )
                : ListView.builder(
                    itemCount: controller.Dumping.length,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.Dumping[index];
                      bool isQr3NotNull = item['attributes']['qr_3'] != null;
                      String formatDate(String dateStr) {
                        DateTime dateTime = DateTime.parse(dateStr);
                        return DateFormat('dd/MM/yyyy kk:mm').format(dateTime);
                      }

                      return InkWell(
                          onTap: () async {
                            await Get.to(DumpingDetailView(item: item));
                          },
                          child: Card(
                            surfaceTintColor: Colors.white10,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                            item['attributes']['nama_dumping'],
                                            style: TextStyle(
                                                fontWeight: bold,
                                                fontSize: 15)),
                                      ),
                                      if (isQr3NotNull)
                                        Text("Approved")
                                      else
                                        Text("Waiting Approval")
                                      // Icon(Icons.check, color: Colors.green),
                                    ],
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    formatDate(item['attributes']['createdAt']),
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  SizedBox(height: 15),
                                  Row(children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.grey[200],
                                      backgroundImage: NetworkImage(
                                        item['attributes']['evident_1'] ??
                                            "${ApiUrl.baseUrl}/uploads/thumbnail_no_image_251fa67e50.jpg",
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.grey[200],
                                      backgroundImage: NetworkImage(
                                        item['attributes']['evident_2'] ??
                                            "${ApiUrl.baseUrl}/uploads/thumbnail_no_image_251fa67e50.jpg",
                                      ),
                                    ),
                                  ])
                                ],
                              ),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                          ));
                    },
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Get.to(DumpingPostView());
          controller.getProfile();
        },
      ),
    );
  }

  @override
  State<DumpingView> createState() => DumpingController();
}

class ShimmerDumpingListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white10,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 60.0,
                    height: 15.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 100.0,
                height: 10.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[200],
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[200],
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    );
  }
}
