import 'package:flutter/material.dart';

class Util {
  void showSnackBar({required String content, required BuildContext context}) {
    final snackBar = SnackBar(
        content: Text(
      content,
      style: const TextStyle(color: Colors.red),
    ));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
