import 'package:flutter/material.dart';

class CourseTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode; // FocusNode como parámetro obligatorio

  const CourseTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.focusNode, // Ahora es requerido
  });

  @override
  _CourseTextFieldState createState() => _CourseTextFieldState();
}

class _CourseTextFieldState extends State<CourseTextField> {
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    // Usamos el FocusNode proporcionado externamente
    widget.focusNode.addListener(() {
      setState(() {
        _isFocused = widget.focusNode.hasFocus;
      });
    });
  }

  // NOTA: Ya no necesitamos dispose() porque el FocusNode es manejado externamente

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_isFocused) const SizedBox(height: 25),
        TextField(
          controller: widget.controller,
          focusNode: widget.focusNode, // Usamos el FocusNode proporcionado
          decoration: InputDecoration(
            label: Text(widget.hintText),
            labelStyle: _isFocused ? const TextStyle(color: Colors.blue) : null,
            suffixIcon:
                widget.controller.text.isNotEmpty
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
