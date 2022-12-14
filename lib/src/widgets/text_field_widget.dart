import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String? input)? onChanged;
  final String? obscuringCharacter;
  final bool? obscureText;
  final String hintText;
  const CustomTextField(
      {this.onChanged,
      this.obscureText,
      required this.hintText,
      this.obscuringCharacter,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      onChanged: onChanged,
      // obscuringCharacter: obscuringCharacter ?? '',
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
