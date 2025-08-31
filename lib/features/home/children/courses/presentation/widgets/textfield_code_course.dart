import 'package:flutter/material.dart';

class TextFieldCodeCourse extends StatefulWidget {
  final TextEditingController textEditingController;
  final String label;
  const TextFieldCodeCourse({
    super.key,
    required this.textEditingController,
    required this.label,
  });

  @override
  State<TextFieldCodeCourse> createState() => _TextFieldCodeCourseState();
}

class _TextFieldCodeCourseState extends State<TextFieldCodeCourse> {
  bool _isFocused = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        label: Text(widget.label),
        labelStyle: _isFocused ? const TextStyle(color: Colors.blue) : null,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
    );
  }
}
