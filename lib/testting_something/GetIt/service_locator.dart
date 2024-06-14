import 'package:get_it/get_it.dart';
import 'package:SiPandu/core.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => UserServices());
}
