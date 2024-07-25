import 'package:SiPandu/service/service_refresh_token/refresh_token_service.dart';
import 'package:get/get.dart';

import 'extensions/network_controller.dart';

class DependencyInjection {
  static void init() {
    // Pemanggilan trigger token check
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }

  static Future<NetworkController> get networkController async {
    NetworkController controller = Get.find();
    await controller.checkTokenStatus(); // Call checkTokenStatus() here
    if (controller.checkTokenStatus == true)
      await RefreshTokenService().refreshToken();
    return controller;
  }
}
