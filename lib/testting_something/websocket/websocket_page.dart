// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebScoketPage extends StatefulWidget {
  final WebSocketChannel channel;
  const WebScoketPage({
    Key? key,
    required this.channel,
  }) : super(key: key);

  @override
  State<WebScoketPage> createState() => _WebScoketPageState();
}

class _WebScoketPageState extends State<WebScoketPage> {
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebScoket Page"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  initialValue: 'John Doe',
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "What's your name?",
                  ),
                  onChanged: (value) {
                    name = value;
                    log("Name: $name");
                  },
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              StreamBuilder(
                stream: widget.channel.stream,
                builder: (context, snapshot) {
                  log("Running snapshot: ${snapshot}");
                  log("Running snapshot.hasData: ${snapshot.hasData}");
                  log("Running snapshot.data: ${snapshot.data}");
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: _sendMyMessage,
      ),
    );
  }

  void _sendMyMessage() {
    if (name != null) {
      widget.channel.sink.add(name);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}
