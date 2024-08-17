import 'package:flutter/material.dart';
import 'package:SiPandu/core.dart';

class MainNavigationView extends StatefulWidget {
  MainNavigationView({Key? key}) : super(key: key);

  Widget build(context, MainNavigationController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 3,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: [
            DashboardView(),
            NewsView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: (newIndex) {
            controller.updateIndex(newIndex);
            if (newIndex == 0) {
              RefreshTokenService().refreshToken();
              NetworkController().checkTokenStatus();
              ProfileController.instance.getProfile();
            } else if (newIndex == 1) {
              RefreshTokenService().refreshToken();
              NetworkController().checkTokenStatus();
              ProfileController.instance.getProfile();
              ProfileController.instance.getLoading();
              ProfileController.instance.getHauling();
              ProfileController.instance.getDumping();
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.message,
              ),
              label: "News",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.faceMan,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
