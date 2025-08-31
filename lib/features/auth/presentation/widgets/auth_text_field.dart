import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final String hintText;
  final bool isObscureText;
  final TextEditingController textEditingController;
  // final ScrollController scrollController;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;

  const AuthTextField({
    super.key,
    required this.hintText,
    this.isObscureText = false,
    required this.textEditingController,
    //   required this.scrollController,
    required this.validator,
    this.textInputType,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
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
    return Padding(
      padding: EdgeInsets.only(bottom: isFocused ? 0 : 0),
      child: TextFormField(
        // onTap: () {
        //   widget.scrollController.animateTo(
        //     widget.scrollController.position.minScrollExtent + 150,
        //     duration: Duration(milliseconds: 500),
        //     curve: Curves.easeOut,
        //   );
        // },
        //   onChanged: (value) {},
        focusNode: focusNode,
        keyboardType: widget.textInputType,
        obscureText: widget.isObscureText,

        controller: widget.textEditingController,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey),
          labelText: isFocused ? widget.hintText : null,
          labelStyle: TextStyle(color: Colors.blue),
        ),
        validator: widget.validator,
      ),
    );
  }
}
