import 'package:flutter/material.dart';

class QPasswordField extends StatefulWidget {
  final String? id;
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool enabled;
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;

  const QPasswordField({
    Key? key,
    required this.label,
    this.id,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    this.maxLength,
    required this.onChanged,
    this.onSubmitted,
    this.obscure = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<QPasswordField> createState() => _QPasswordFieldState();
}

class _QPasswordFieldState extends State<QPasswordField> {
  TextEditingController textEditingController = TextEditingController();
  bool _isValid = true;
  bool _obscureText = true;

  @override
  void initState() {
    textEditingController.text = widget.value ?? "";
    _obscureText = widget.obscure;
    super.initState();
  }

  getValue() {
    return textEditingController.text;
  }

  setValue(value) {
    textEditingController.text = value;
  }

  resetValue() {
    textEditingController.text = "";
  }

  focus() {
    focusNode.requestFocus();
  }

  FocusNode focusNode = FocusNode();

  void _validateInput(String value) {
    setState(() {
      _isValid = widget.validator?.call(value) == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12.0,
      ),
      child: TextFormField(
        enabled: widget.enabled,
        controller: textEditingController,
        focusNode: focusNode,
        validator: widget.validator,
        maxLength: widget.maxLength,
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          suffixIcon: widget.suffixIcon != null
              ? IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          helperText: widget.helper,
          hintText: widget.hint,
          errorText: _isValid ? null : 'This field is required',
        ),
        onChanged: (value) {
          _validateInput(value);
          widget.onChanged(value);
        },
        onFieldSubmitted: (value) {
          _validateInput(value);
          if (widget.onSubmitted != null) widget.onSubmitted!(value);
        },
      ),
    );
  }
}
