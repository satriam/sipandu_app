import 'package:SiPandu/core.dart';

class InitialLocal {
  static Future<void> initialize() async {
    await AppLocalStorage.init();
    await UserLocalStorage.init();
  }
}
