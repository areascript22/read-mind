import 'package:flutter/material.dart';

class CourseTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;


  const CourseTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CourseTextField> {
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
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hint como etiqueta superior cuando está enfocado
        if (_isFocused) const SizedBox(height: 25),
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            label: Text(widget.hintText),
            labelStyle: _isFocused ? const TextStyle(color: Colors.blue) : null,
            suffixIcon: widget.controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      widget.controller.clear();
                      setState(() {});
                    },
                  )
                : null,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
          ),
          onChanged: (value) {
            setState(() {}); // Actualizar la UI cuando cambia el texto
          },
        ),
      ],
    );
  }
}
