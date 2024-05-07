import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CahcedNetworkImagePage extends StatelessWidget {
  const CahcedNetworkImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        "https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.network(
                imageUrl,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 24.0,
              ),
              CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              const SizedBox(
                height: 24.0,
              ),
              CachedNetworkImage(
                imageUrl: imageUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              CachedNetworkImage(
                imageUrl: 'https://example.com/image.jpg',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
                alignment: Alignment.center,
                repeat: ImageRepeat.noRepeat,
                width: 200,
                height: 200,
                color: Colors.red,
                colorBlendMode: BlendMode.difference,
              )
            ],
          ),
        ),
      ),
    );
  }
}
