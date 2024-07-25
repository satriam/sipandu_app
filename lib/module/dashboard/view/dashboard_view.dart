import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    List<Map> categories = [
      {
        'title': 'Loading Point',
        'total': '${controller.loading.length}',
      },
      {
        'title': 'Dumping Point',
        'total': '${controller.dumping.length}',
      },
      {
        'title': 'Hauling Road',
        'total': '${controller.hauling.length}',
      },
      {
        'title': 'Accept report',
        'total': '${controller.total}',
      },
    ];

    List carousel = [
      'assets/icon/apple-logo.png',
      'assets/icon/apple-logo.png',
      'assets/icon/apple-logo.png',
    ];

    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Container(),
          leadingWidth: 0.0,
          title: SizedBox(
            child: Row(
              children: [
                const Text(
                  'Si-Pandu',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await controller.getProfile();
            await controller.getLoading();
            await controller.getDumping();
            await controller.getHauling();
          },
          child: Stack(
            children: [
              ClipPath(
                clipper: SinCosineWaveClipper(),
                child: Container(
                  height: 240,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
// image: NetworkImage('https://capekngoding.com/uploads/62f5f123a60ae_15.png'),
                      image: AssetImage('assets/images/background.jpg'),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.blueGrey[800]!.withOpacity(0.7),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${controller.profile['Nama']}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                        Text(
                          "${controller.profile['Jabatan']}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Text(
                          'NP',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          "${controller.profile['Nomor_pegawai']}",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Card(
                      surfaceTintColor: Color.fromARGB(25, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 5,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shift Saat Ini',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${controller.currentShift}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Grup Aktif',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${controller.activeGroup}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hari Ini',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${controller.currentDate}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      surfaceTintColor: Color.fromARGB(25, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 5,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoadingView()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icon/loading.png', // Provide the correct asset path
                                    height: 50,
                                    width: 90,
                                  ),
                                  const Text(
                                    'Loading Point',
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DumpingView()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icon/dumpings.png', // Provide the correct asset path
                                    height: 50,
                                    width: 90,
                                  ),
                                  const Text(
                                    'Dumping Point',
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // controller.getRefresh();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HaulingView()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icon/haulingroad.png', // Provide the correct asset path
                                    height: 50,
                                    width: 90,
                                  ),
                                  const Text(
                                    'Hauling Road',
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                        .animate()
                        .move(
                          duration: ((1) * 400).ms,
                        )
                        .fadeIn(),
                    const SizedBox(height: 10),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, bottom: 8, top: 10),
                      child: Text(
                        "Total aktivitas hari ini :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    GridView.builder(
                      padding: const EdgeInsets.all(1.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.5,
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                      ),
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var item = categories[index];
                        return Card(
                            surfaceTintColor: Color.fromARGB(25, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${item['title']}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '${item['total']}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  // Add other widgets here if needed
                                ],
                              ),
                            ));
                      },
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(carousel.length, (index) {
                        var item = carousel[index];
                        return Card(
                          child: Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width - 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    '$item'), // Use AssetImage for local assets
                              ),
                            ),
                          ),
                        );
                      })),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
