import 'package:flutter/material.dart';

void customSnakeBar(BuildContext context,
    {required String text, required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 100.0, left: 20, right: 20),
      backgroundColor: color,
      content: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
