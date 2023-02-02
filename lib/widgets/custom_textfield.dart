import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.hintText,
    this.onChanged,
  });
  String? hintText;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hintText == 'Password' ? true : false,
      validator: (value) {
        if (value!.isEmpty) {
          return 'field is required';
        }
      },
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
