import 'package:get_it/get_it.dart';
import 'package:hyper_ui/testting_something/GetIt/service/user_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => UserServices());
}
