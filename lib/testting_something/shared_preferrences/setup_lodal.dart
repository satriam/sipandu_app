import 'package:hyper_ui/testting_something/shared_preferrences/local/app_local.dart';
import 'package:hyper_ui/testting_something/shared_preferrences/local/user_local.dart';

class InitialLocal {
  static Future<void> initialize() async {
    await AppLocalStorage.init();
    await UserLocalStorage.init();
  }
}
