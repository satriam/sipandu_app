import 'package:flutter/material.dart';

class QMemoField extends StatefulWidget {
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final Function(String) onChanged;

  const QMemoField({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    required this.onChanged,
    this.maxLength,
    this.maxLines,
  }) : super(key: key);

  @override
  State<QMemoField> createState() => _QMemoFieldState();
}

class _QMemoFieldState extends State<QMemoField> {
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  bool isBold = false;
  bool isUnderline = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 300), () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Scrollable.ensureVisible(
              context,
              alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
            );
          });
        });
      }
    });
    if (widget.value != null) {
      _controller.text = widget.value!;
    }
  }

  void _toggleBold() {
    setState(() {
      isBold = !isBold;
    });
  }

  void _toggleUnderline() {
    setState(() {
      isUnderline = !isUnderline;
    });
  }

  TextStyle _getTextStyle() {
    return TextStyle(
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12.0,
      ),
      child: Column(
        children: [
          TextFormField(
            controller: _controller,
            focusNode: focusNode,
            validator: widget.validator,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines ?? 6,
            decoration: InputDecoration(
              labelText: widget.label,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.format_bold),
                    onPressed: _toggleBold,
                    color: isBold ? Colors.blue : Colors.grey,
                  ),
                  IconButton(
                    icon: Icon(Icons.format_underline),
                    onPressed: _toggleUnderline,
                    color: isUnderline ? Colors.blue : Colors.grey,
                  ),
                ],
              ),
              helperText: widget.helper,
              hintText: widget.hint,
            ),
            onChanged: (text) {
              widget.onChanged(text);
              setState(() {});
            },
            style: _getTextStyle(),
          ),
        ],
      ),
    );
  }
}
