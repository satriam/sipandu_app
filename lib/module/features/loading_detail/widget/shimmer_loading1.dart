import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // Placeholder for the image with shimmer effect
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.white,
              ),
              // Adjust duration as needed
              period: Duration(milliseconds: 800),
            ),

            // Jarak antara gambar dan teks
            // Kolom berisi beberapa baris teks di sebelah kanan
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildShimmerText(),
                    _buildShimmerText(),
                    _buildShimmerText(),
                    _buildShimmerText(),
                    _buildShimmerText(),
                    _buildShimmerText(),
                    _buildShimmerText(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: double.infinity,
          height: 16.0,
          color: Colors.white,
        ),
        // Adjust duration as needed
        period: Duration(milliseconds: 800),
      ),
    );
  }
}
