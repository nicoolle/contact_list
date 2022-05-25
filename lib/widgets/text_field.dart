import 'package:flutter/material.dart';

class ContactTextField extends StatefulWidget {
  final String placeholder;
  final TextEditingController controller;
  final ValueChanged<String>? onTextChanged;

  const ContactTextField(
      {Key? key,
      required this.placeholder,
      required this.controller,
      required this.onTextChanged})
      : super(key: key);

  @override
  State<ContactTextField> createState() => _ContactTextFieldState();
}

class _ContactTextFieldState extends State<ContactTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: TextStyle(fontSize: 17),
      onChanged: (text) {
        widget.onTextChanged!(text);
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(183, 183, 183, 1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(31, 143, 232, 1),
          ),
        ),
        hintText: widget.placeholder,
        hintStyle: const TextStyle(
          fontFamily: 'Roboto',
          color: Colors.blueGrey,
          fontSize: 16,
        ),
        labelText: widget.placeholder,
      ),
    );
  }
}
