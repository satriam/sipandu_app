import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    List<Map> categories = [
      {
        'icon': 'assets/icon/apple-logo.png',
        'title': 'Inspeksi Bulanan',
      },
      {
        'icon': 'assets/icon/apple-logo.png',
        'title': 'Inspeksi Harian',
      },
      {
        'icon': 'assets/icon/apple-logo.png',
        'title': 'Safety Talk',
      },
      {
        'icon': 'assets/icon/apple-logo.png',
        'title': 'Pengaduan',
      },
      {
        'icon': 'assets/icon/apple-logo.png',
        'title': 'Promotif',
      },
      {
        'icon': 'assets/icon/apple-logo.png',
        'title': 'Accident',
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
      body: Stack(
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
                                'assets/icon/dumping.png', // Provide the correct asset path
                                height: 40,
                                width: 90,
                              ),
                              const SizedBox(height: 5),
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
                                'assets/icon/dumping.png', // Provide the correct asset path
                                height: 40,
                                width: 90,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Dumping Point',
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
                                    builder: (context) => HaulingView()));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icon/dumping.png', // Provide the correct asset path
                                height: 40,
                                width: 90,
                              ),
                              const SizedBox(height: 5),
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
                ),
                const SizedBox(height: 20),
                GridView.count(
                  crossAxisCount: 3, // Display 3 items in a row
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling
                  shrinkWrap:
                      true, // Allow the GridView to occupy only the space it needs
                  children: List.generate(
                    categories.length,
                    (index) {
                      var item = categories[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[200],
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    '${item['icon']}',
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 80,
                                child: Text(
                                  '${item['title']}',
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
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
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
