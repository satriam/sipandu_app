import 'package:hyper_ui/core.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

class DioService {
  final Dio dio = Dio();
  final talker = Talker();

  DioService() {
    dio.interceptors.add(TalkerDioLogger(
      talker: talker,
      settings: TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printRequestData: true,
        printResponseHeaders: true,
        printResponseData: true,
        printResponseMessage: true,
      ),
    ));
  }
}
