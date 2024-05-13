import 'package:get/get.dart';
import 'package:hyper_ui/core.dart';
import '../view/loading_view.dart';

class LoadingController extends GetxController {
  LoadingView? view;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Map<String, dynamic> profile = {}; // Change the type to Map<String, dynamic>

  getProfile() async {
    dynamic profileData = await ProfileService()
        .get(); // Assuming ProfileService().get() returns dynamic
    if (profileData is Map<String, dynamic>) {
      profile = profileData;
    } else {
      // Handle the case where profileData is not in the expected format
      print("Profile data is not in the expected format.");
    }
  }
}
