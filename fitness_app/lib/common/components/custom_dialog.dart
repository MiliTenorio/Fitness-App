import 'package:fitness_app/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomDialog {
  void showCustomDialog(
    BuildContext context,
    String title,
    String content,
    IconData? icon,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: Row(
            children: [
              Icon(icon),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                content,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.justGrey,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Modular.to.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Modular.to.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
