import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyCliboardPage extends StatefulWidget {
  const CopyCliboardPage({Key? key}) : super(key: key);

  @override
  State<CopyCliboardPage> createState() => _CopyCliboardPageState();
}

class _CopyCliboardPageState extends State<CopyCliboardPage> {
  final String text1 = "asdadadadwqe414134515";
  final TextEditingController _textController = TextEditingController();

  // This function is triggered when the copy icon is pressed
  Future<void> _copyToClipboard() async {
    print("RUNNING: ${_textController.text}");
    await Clipboard.setData(ClipboardData(text: _textController.text));

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }

  Future<void> _copyToClipboard2() async {
    print("RUNNING2: ${text1}");
    await Clipboard.setData(ClipboardData(text: text1));

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kindacode.com'),
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(30),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  icon: IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: _copyToClipboard,
                  ),
                ),
              ),
            )),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: _copyToClipboard2,
                ),
              ],
            )),
          ],
        ));
  }
}
