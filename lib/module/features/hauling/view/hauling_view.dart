import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart' as getx;
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:SiPandu/core.dart';

class HaulingView extends StatefulWidget {
  const HaulingView({Key? key}) : super(key: key);

  Widget build(context, HaulingController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(title: const Text("Hauling History"), actions: [
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
        child: getx.Obx(() => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: QCategoryPicker(
                    items: [
                      {"label": "All", "value": ""},
                      {
                        "label": "Waiting Approval Inspector",
                        "value": "Waiting Approval Inspector"
                      },
                      {
                        "label": "Waiting Approval Supervisor",
                        "value": "Waiting Approval Supervisor"
                      },
                      {"label": "Complete", "value": "Complete"},
                    ],
                    value: controller.selectedCategory.value.isEmpty
                        ? null
                        : controller.selectedCategory.value,
                    validator: Validator.required,
                    onChanged: (index, label, value, item) async {
                      controller.selectedCategory.value = value ?? "";
                      controller.filteredHauling;
                      await controller.getProfile();
                    },
                  ),
                ),
                Expanded(
                  child: controller.isLoading
                      ? ListView.builder(
                          itemCount: 5,
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ShimmerHaulingListItem();
                          },
                        )
                      : controller.filteredHauling.isEmpty
                          ? Center(
                              child: Lottie.asset(
                                  'assets/animation/notfoundata.json'),
                            )
                          : ListView.builder(
                              itemCount: controller.filteredHauling.length,
                              physics: const ScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                var item = controller.filteredHauling[index];

                                item['attributes']['qr_3'] != null;
                                String formatDate(String dateStr) {
                                  DateTime dateTime = DateTime.parse(dateStr);
                                  return DateFormat('dd/MM/yyyy kk:mm')
                                      .format(dateTime);
                                }

                                return InkWell(
                                  onTap: () async {
                                    await Get.to(HaulingDetailView(item: item));
                                  },
                                  child: Card(
                                    surfaceTintColor: Colors.white10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  item['attributes']
                                                      ['nama_hauling'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              Text(
                                                item['attributes']['status'],
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            formatDate(item['attributes']
                                                ['createdAt']),
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 25,
                                                backgroundColor:
                                                    Colors.grey[200],
                                                backgroundImage: NetworkImage(
                                                  item['attributes']
                                                          ['evident_1'] ??
                                                      "${AppConfig.imageUrlNotFound}",
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              CircleAvatar(
                                                radius: 25,
                                                backgroundColor:
                                                    Colors.grey[200],
                                                backgroundImage: NetworkImage(
                                                  item['attributes']
                                                          ['evident_2'] ??
                                                      "${AppConfig.imageUrlNotFound}",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    elevation: 5,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                  )
                                      .animate()
                                      .moveX(
                                        begin: index % 2 == 0 ? -200 : 200,
                                        duration: ((index + 1) * 400).ms,
                                      )
                                      .fadeIn(),
                                );
                              },
                            ),
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Get.to(HaulingPostView());
          controller.getProfile();
        },
      ),
    );
  }

  @override
  State<HaulingView> createState() => HaulingController();
}

class ShimmerHaulingListItem extends StatelessWidget {
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
