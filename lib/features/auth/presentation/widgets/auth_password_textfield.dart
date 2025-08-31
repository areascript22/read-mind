import 'package:flutter/material.dart';

class AuthPasswordTextfield extends StatefulWidget {
  final String hintText;
  final bool isObscureText;
  final TextEditingController textEditingController;

  final String? Function(String?)? validator;
  const AuthPasswordTextfield({
    super.key,
    required this.hintText,
    this.isObscureText = false,
    required this.textEditingController,

    required this.validator,
  });

  @override
  State<AuthPasswordTextfield> createState() => _AuthPasswordTextfieldState();
}

class _AuthPasswordTextfieldState extends State<AuthPasswordTextfield> {
  bool _isObscured = true;

  final focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        // widget.scrollController.animateTo(
        //   widget.scrollController.position.minScrollExtent + 150,
        //   duration: Duration(milliseconds: 500),
        //   curve: Curves.easeOut,
        // );
      },
      focusNode: focusNode,
      obscureText: _isObscured,
      controller: widget.textEditingController,
      //controller
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey),
        labelText: isFocused ? widget.hintText : null,
        labelStyle: TextStyle(color: Colors.blue),

        suffixIcon: IconButton(
          icon: Icon(_isObscured ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ),
      ),
      validator: widget.validator,
    );
  }
}
