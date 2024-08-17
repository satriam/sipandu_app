import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;
    String? thumbnailUrl = controller.profile['profile_image'] ??
        "https://sipandu-api.rehandling.my.id/uploads/no_image_b1d966e1bd.jpg";
    String fullThumbnailUrl = thumbnailUrl != null ? '$thumbnailUrl' : '';

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueGrey[800],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              ProfileController.instance.doLogout(context);
            },
            icon: const Icon(
              Icons.logout,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 110.0,
              ),
              width: MediaQuery.of(context).size.width,
              color: Colors.blueGrey[800],
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: thumbnailUrl != null
                        ? NetworkImage(fullThumbnailUrl)
                        : null,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${controller.profile['Nomor_pegawai']}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                        Text(
                          "${controller.profile['Nama']}",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  InkWell(
                    onTap: () async {
                      // await Get.to(ProfileFormView());
                      return AwesomeDialog(
                        context: context,
                        dialogType: DialogType.info,
                        headerAnimationLoop: true,
                        animType: AnimType.topSlide,
                        desc: 'Sedang Tahap Pengembangan',
                        btnOkOnPress: () => Get.back(),
                      ).show();
                    },
                    child: CircleAvatar(
                      radius: 16.0,
                      backgroundColor: Colors.blueGrey[900],
                      child: const Icon(
                        Icons.edit,
                        size: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 20.0,
                right: 20.0,
                bottom: 0.0,
              ),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () async {
                          await Get.to(HaulingView());
                        },
                        child: Column(
                          children: [
                            Icon(Icons.add_road),
                            Text(
                              "${controller.hauling.length}",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Hauling",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: InkWell(
                        onTap: () async {
                          await Get.to(LoadingView());
                        },
                        child: Column(
                          children: [
                            Icon(Icons.local_shipping),
                            Text(
                              "${controller.loading.length}",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Loading",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: InkWell(
                        onTap: () async {
                          await Get.to(DumpingView());
                        },
                        child: Column(
                          children: [
                            Icon(Icons.post_add),
                            Text(
                              "${controller.dumping.length}",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Dumping",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Builder(
                builder: (context) {
                  List items = [
                    {
                      "label": "Change Password",
                      "icon": Icons.password,
                      "on_tap": () async {
                        await Get.to(ChangePasswordView());
                      }
                    },
                    {
                      "label": "Privacy Policy",
                      "icon": Icons.info,
                      "on_tap": () {
                        return AwesomeDialog(
                          context: context,
                          dialogType: DialogType.info,
                          headerAnimationLoop: true,
                          animType: AnimType.topSlide,
                          desc: 'Sedang Tahap Pengembangan',
                          btnOkOnPress: () => Get.back(),
                        ).show();
                      }
                    },
                    {
                      "label": "About",
                      "icon": Icons.accessibility_new_outlined,
                      "on_tap": () {
                        return AwesomeDialog(
                          context: context,
                          dialogType: DialogType.info,
                          headerAnimationLoop: true,
                          animType: AnimType.topSlide,
                          title: 'SIPANDU',
                          titleTextStyle: TextStyle(
                            fontWeight: bold,
                          ),
                          desc: 'version ${controller.version}',
                          btnOkOnPress: () => Get.back(),
                        ).show();
                      }
                    }
                  ];

                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 12.0,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: items.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var item = items[index];
                          return InkWell(
                            onTap: () {
                              if (item["on_tap"] != null) {
                                item["on_tap"]!();
                              }
                            },
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: ListTile(
                                  leading: Icon(
                                    item["icon"],
                                    size: 30.0,
                                  ),
                                  title: Text(item["label"]),
                                  trailing: const Icon(
                                    Icons.chevron_right,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
