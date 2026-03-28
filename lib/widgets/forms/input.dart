import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XInput extends StatefulWidget {
  const XInput({
    required this.value,
    super.key,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.decoration,
    this.textAlign = TextAlign.left,
    this.style,
    this.maxLength,
    this.autofocus = false,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.focusNode,
    this.enabled = true,
    this.readOnly = false,
    this.validator,
  });
  final String value;
  final TextInputType? keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final InputDecoration? decoration;
  final int? maxLength;
  final bool autofocus;
  final TextAlign textAlign;
  final TextStyle? style;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool enabled;
  final bool readOnly;
  final String? Function(String?)? validator;

  @override
  State<XInput> createState() => _XInputState();
}

class _XInputState extends State<XInput> {
  late TextEditingController _controller;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(XInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_controller.text != widget.value) {
      final cursorPosition = _controller.selection.baseOffset;
      _controller.text = widget.value;
      // Preserve cursor position when possible
      if (cursorPosition <= widget.value.length) {
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: cursorPosition),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? buildSuffixActions() {
      final actions = <Widget>[];

      // Clear button
      if (_controller.text.isNotEmpty && widget.enabled && !widget.readOnly) {
        actions.add(
          IconButton(
            icon: const Icon(Icons.cancel, size: 20),
            tooltip: 'Clear',
            onPressed: () {
              _controller.clear();
              widget.onChanged?.call('');
            },
          ),
        );
      }

      // Password visibility toggle
      if (widget.obscureText) {
        actions.add(
          IconButton(
            icon: Icon(
              _obscureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              size: 20,
            ),
            tooltip: _obscureText ? 'Show password' : 'Hide password',
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        );
      }

      if (actions.isEmpty) return null;
      if (actions.length == 1) return actions.first;

      return Row(mainAxisSize: MainAxisSize.min, children: actions);
    }

    return TextFormField(
      controller: _controller,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      style: widget.style,
      textAlign: widget.textAlign,
      obscureText: _obscureText,
      maxLength: widget.maxLength,
      autofocus: widget.autofocus,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      validator: widget.validator,
      scrollPhysics: const NeverScrollableScrollPhysics(),
      inputFormatters: widget.inputFormatters,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: (widget.decoration ?? const InputDecoration()).copyWith(
        prefixIcon: widget.textAlign == TextAlign.center
            ? const SizedBox(width: 24)
            : null,
        labelStyle: const TextStyle(color: Color(0xCC50555C)),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: false,
        errorStyle: const TextStyle(fontSize: 14, letterSpacing: 0.25),
        suffixIcon: buildSuffixActions(),
        // Ensure consistent counter style
        counterStyle: const TextStyle(fontSize: 12),
      ),
    );
  }
}
