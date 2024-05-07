import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workmanager/workmanager.dart';

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    log(
      "Native called background task: $task",
    );

    try {
      var response = await Dio().post(
        "https://capekngoding.com/demo/api/users",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "user_name": "Demo",
          "latitude": "40.7128",
          "longitude": "74.0060",
          "created_at": DateTime.now().toString(),
        },
      );
      log("Running: ${response.statusCode}");
      Map obj = response.data;
    } on Exception catch (err) {
      log(err.toString());
    }
    return Future.value(true);
  });
}

class CustomWorkManager {
  static init() async {
    if (!kIsWeb && Platform.isWindows) return;
    Workmanager().initialize(
        callbackDispatcher, // The top level function, aka callbackDispatcher
        isInDebugMode:
            true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
        );
  }

  static runOnce({
    required String taskname,
  }) async {
    Workmanager().registerOneOffTask(
      "task-identifier",
      "updateUser",
    );
  }

  static runAfter({
    required String taskname,
    required Duration duration,
  }) async {
    Workmanager().registerOneOffTask(
      "task-identifier",
      "updateUser",
      initialDelay: duration,
    );
  }

  static runEvery({
    required String taskname,
    required Duration duration,
  }) async {
    Workmanager().registerPeriodicTask(
      "task-identifier",
      "updateUser",
      frequency: duration,
    );
  }
}
