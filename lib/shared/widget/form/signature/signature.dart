import 'dart:typed_data';
import 'package:SiPandu/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signature/signature.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class QSignature extends StatefulWidget {
  final String id; // Unique identifier for the signature type
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final bool enabled;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;

  const QSignature({
    Key? key,
    required this.id, // Make id required
    required this.label,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    required this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<QSignature> createState() => _QSignatureState();
}

class _QSignatureState extends State<QSignature> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onClear() {
    _controller.clear();
  }

  Future<void> _onSave() async {
    if (_controller.isNotEmpty) {
      final String filePath = await _saveSignature(widget.id);

      // Push signature to API and get URL
      final url = await pushSignatureToAPI(filePath);

      if (url != null) {
        widget.onChanged(url);
        if (widget.onSubmitted != null) {
          widget.onSubmitted!(url);
        }
      }
    }
  }

  Future<String> _saveSignature(String id) async {
    final Uint8List data = await _controller.toPngBytes() ?? Uint8List(0);
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/${id}_signature.png';
    final file = File(path);
    await file.writeAsBytes(data);
    return path;
  }

  Future<String?> pushSignatureToAPI(String filePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final urlapi = '${ApiUrl.baseUrl}/api/upload';
    final file = File(filePath);

    // Send the image file to the API using Dio
    final dio = Dio();
    final formData = FormData.fromMap({
      'files': await MultipartFile.fromFile(file.path),
    });

    final response = await dio.post(
      urlapi,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
      data: formData,
    );
    var data = response.data;
    var realurl = data[0]["url"];
    var url = '${ApiUrl.baseUrl}$realurl';

    widget.onChanged(url);
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Signature(
              controller: _controller,
              height: 150,
              backgroundColor: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: widget.enabled ? _onClear : null,
                child: const Text('Clear'),
              ),
              TextButton(
                onPressed: widget.enabled ? _onSave : null,
                child: const Text('Save'),
              ),
            ],
          ),
          if (widget.helper != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                widget.helper!,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }
}
