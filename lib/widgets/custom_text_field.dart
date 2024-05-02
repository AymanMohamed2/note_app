import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.text,
    this.onSaved,
    this.controller,
    this.suffixIcon,
    this.onChanged,
    this.lable,
  });
  final String? text;
  final String? lable;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      cursorColor: const Color.fromARGB(255, 28, 228, 167),
      controller: controller,
      style: const TextStyle(
        color: Color.fromARGB(255, 28, 228, 167),
      ),
      onChanged: onChanged,
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: lable,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 197, 192, 192)),
        suffixIcon: suffixIcon,
        hintText: text,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 28, 228, 167)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 28, 228, 167),
          ),
        ),
      ),
    );
  }
}
