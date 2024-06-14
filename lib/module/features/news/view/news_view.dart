import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:SiPandu/core.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  Widget build(context, NewsController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(title: const Text("News"), actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () async {
            await controller.getNews();
          },
        ),
      ]),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getNews();
        },
        child: controller.isLoading
            ? ListView.builder(
                itemCount: 5, // Jumlah item untuk efek shimmer
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ShimmerHaulingListItem();
                },
              )
            : controller.Information.isEmpty
                ? Center(
                    child: Lottie.asset('assets/animation/notfoundata.json'),
                  )
                : ListView.builder(
                    itemCount: controller.Information.length,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.Information[index];

                      String formatDate(String dateStr) {
                        DateTime dateTime = DateTime.parse(dateStr);
                        return DateFormat('dd/MM/yyyy kk:mm').format(dateTime);
                      }

                      return InkWell(
                          onTap: () async {
                            await Get.to(HaulingDetailView(item: item));
                          },
                          child: Card(
                            surfaceTintColor: Colors.white10,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.grey[200],
                                        backgroundImage: NetworkImage(
                                          item['users_permissions_user']
                                                      ?['data']?['attributes']
                                                  ?['profile_image'] ??
                                              "${ApiUrl.baseUrl}/uploads/thumbnail_no_image_251fa67e50.jpg",
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              10), // Menambahkan sedikit jarak antara avatar dan teks
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start, // Menambahkan properti ini
                                        children: [
                                          Text(
                                            item['users_permissions_user']
                                                        ?['data']?['attributes']
                                                    ?['Nama'] ??
                                                "tidak ada nama",
                                            style: TextStyle(
                                              fontWeight: FontWeight
                                                  .bold, // Menggunakan FontWeight.bold bukan bold
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            formatDate(item['createdAt']),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                            // item['attributes']['tanggal'],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: 5,
                                  ),
                                  Text(item['information'] ?? ""),
                                  Divider(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    // Memposisikan PillBadge di sebelah kanan
                                    children: [PillBadge(text: "Penting")],
                                  )
                                ],
                              ),
                            ),
                            elevation: 2,
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                          ));
                    },
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Get.to(NewsPostView());
          controller.getNews();
        },
      ),
    );
  }

  @override
  State<NewsView> createState() => NewsController();
}

class ShimmerNewsListItem extends StatelessWidget {
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

class PillBadge extends StatelessWidget {
  final String text;

  PillBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: Colors.red, // Warna latar belakang badge
        borderRadius:
            BorderRadius.circular(15.0), // Membuat ujung badge melengkung
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white, // Warna teks
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
