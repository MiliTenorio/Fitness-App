import 'package:fitness_app/common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomGraphCard extends StatelessWidget {
  const CustomGraphCard({
    super.key,
    this.leftWidget,
    this.rightWidget,
    this.centerWidget,
  });
  final Widget? leftWidget;
  final Widget? rightWidget;
  final Widget? centerWidget;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: AppColors.backgroundWhite,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 130,
                width: double.infinity,
                child: (centerWidget == null)
                    ? Row(
                        children: [leftWidget!, rightWidget!],
                      )
                    : centerWidget,
              ),
            ],
          )),
    );
  }
}
