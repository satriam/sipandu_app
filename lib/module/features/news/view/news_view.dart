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

                      var newsTypes = item['news_types']['data'];
                      List<Widget> badgeWidgets = [];

                      for (var newsType in newsTypes) {
                        badgeWidgets.add(
                            PillBadge(text: newsType['attributes']['type']));
                      }

                      return InkWell(
                          onTap: () async {
                            // await Get.to(HaulingDetailView(item: item));
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

                                            // item['attributes']['tanggal'],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: 5,
                                  ),
                                  FormattedText(item['information'] ?? ""),
                                  item['photo'] != null
                                      ? Image.network(
                                          item['photo'],
                                        )
                                      : Container(),
                                  Divider(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    // Memposisikan PillBadge di sebelah kanan
                                    children: badgeWidgets,
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

class FormattedText extends StatelessWidget {
  final String text;

  FormattedText(this.text);

  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans = _getSpans(text);
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: spans,
      ),
    );
  }

  List<TextSpan> _getSpans(String text) {
    List<TextSpan> spans = [];
    final RegExp regex = RegExp(r'(\*\*(.*?)\*\*)|(__((.*?)__))');
    final matches = regex.allMatches(text);

    int start = 0;
    for (final match in matches) {
      if (match.start > start) {
        spans.add(TextSpan(text: text.substring(start, match.start)));
      }
      if (match.group(1) != null) {
        spans.add(TextSpan(
          text: match.group(2),
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
      } else if (match.group(3) != null) {
        spans.add(TextSpan(
          text: match.group(4),
          style: TextStyle(decoration: TextDecoration.underline),
        ));
      }
      start = match.end;
    }
    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }

    return spans;
  }
}

class PillBadge extends StatelessWidget {
  final String text;

  PillBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;

    switch (text.toLowerCase()) {
      case 'penting':
        backgroundColor = Colors.red;
        break;
      case 'hazard report':
        backgroundColor = Colors.orange;
        break;
      case 'info':
        backgroundColor = Colors.green;
        break;
      case 'rapat':
        backgroundColor = Colors.blue;
        break;
      case 'safety campaign':
        backgroundColor = Colors.grey;
        break;
      default:
        backgroundColor =
            Colors.grey; // Warna default jika tidak ada yang cocok
    }

    return Material(
      elevation: 4.0, // Menambahkan elevasi untuk efek bayangan
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 8,
          ),
        ),
      ),
    );
  }
}
