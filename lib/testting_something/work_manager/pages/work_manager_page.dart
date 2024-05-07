import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/testting_something/work_manager/service/location_service.dart';
import 'package:hyper_ui/testting_something/work_manager/service/work_manager_service.dart';

class WorkManagerPage extends StatefulWidget {
  const WorkManagerPage({Key? key}) : super(key: key);

  @override
  State<WorkManagerPage> createState() => _WorkManagerPageState();
}

class _WorkManagerPageState extends State<WorkManagerPage> {
  List<Map> users = [];

  Widget build(
    context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Work Manager Page"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                CustomWorkManager.runOnce(taskname: "updateUser");
              },
              child: const Text("Run once"),
            ),
            const SizedBox(
              height: 12.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                CustomWorkManager.runAfter(
                  taskname: "updateUser",
                  duration: const Duration(seconds: 10),
                );
              },
              child: const Text("Run after 10seconds"),
            ),
            const SizedBox(
              height: 12.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                CustomWorkManager.runEvery(
                  taskname: "updateUser",
                  duration: const Duration(minutes: 15),
                );
              },
              child: const Text("Run every 15 minutes"),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Column(
                children: users
                    .map((e) => ListTile(
                          title: e['user_name'],
                          subtitle: e['time'],
                        ))
                    .toList())
          ],
        ),
      ),
    );
  }
}
