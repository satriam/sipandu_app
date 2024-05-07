// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/testting_something/talker/basic_talker.dart';
import 'package:talker_flutter/talker_flutter.dart';

class TalkerPage extends StatelessWidget {
  final Talker talker;
  const TalkerPage({
    Key? key,
    required this.talker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 100,
                width: 1000,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
            ),
            onPressed: () async {
              var response = await Dio().get(
                "https://reqrssses.in/api/userss",
                options: Options(
                  headers: {
                    "Content-Type": "application/json",
                  },
                ),
              );
              Map obj = response.data;
              print(obj);
            },
            child: const Text("Basic Talker"),
          ),
          const SizedBox(
            height: 42.0,
          ),
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
