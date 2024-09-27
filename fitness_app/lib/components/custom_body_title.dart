import 'package:flutter/material.dart';

class CustomBodyTitle extends StatelessWidget {
  const CustomBodyTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
    );
  }
}
