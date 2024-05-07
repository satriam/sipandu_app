import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class BinanceWebScoketPage extends StatefulWidget {
  const BinanceWebScoketPage({super.key});

  @override
  State<BinanceWebScoketPage> createState() => _BinanceWebScoketPageState();
}

class _BinanceWebScoketPageState extends State<BinanceWebScoketPage> {
  String btcUsdtPrice = "0";
  final channel = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/ws/ethusdt@trade');

  @override
  void initState() {
    super.initState();
    streamListener();
  }

  streamListener() {
    channel.stream.listen(
      (message) {
        // channel.sink.add('received!');
        // channel.sink.close(status.goingAway);
        Map getData = jsonDecode(message);
        setState(() {
          btcUsdtPrice = getData['p'];
        });
        log("Running: $getData");
        log("RunningbtcUsdtPrice: $btcUsdtPrice");
        // print(getData['p']);
      },
      onDone: () {
        log('----------------------------------------Connection closed--------------------------------------------');
      },
      onError: (error) {
        // Callback untuk menangani kesalahan koneksi
        log('----------------------------------------Error: $error ----------------------------------------');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Binance Web Scoket Page"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "ETH/USDT Price",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  btcUsdtPrice,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 250, 194, 25),
                      fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
