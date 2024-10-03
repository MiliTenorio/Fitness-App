import 'package:fitness_app/common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color color;
  final Object? moreInfoOne;
  final Object? moreInfoTwo;

  const CustomCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    required this.color,
    this.moreInfoOne,
    this.moreInfoTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: AppColors.justWhite,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: moreInfoOne != null
                          ? MediaQuery.of(context).size.width - 150
                          : MediaQuery.of(context).size.width - 120,
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: AppColors.justWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    subtitle != null
                        ? SizedBox(
                            width: moreInfoOne != null
                                ? MediaQuery.of(context).size.width - 150
                                : MediaQuery.of(context).size.width - 120,
                            child: Text(
                              subtitle!,
                              style: const TextStyle(
                                color: AppColors.justWhite,
                                fontSize: 12,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //String
                moreInfoOne != null && moreInfoOne is String
                    ? Text(
                        moreInfoOne! as String,
                        style: const TextStyle(
                          color: AppColors.justWhite,
                          fontSize: 12,
                        ),
                      )
                    : const SizedBox(),
                moreInfoTwo != null && moreInfoTwo is String
                    ? Text(
                        moreInfoTwo! as String,
                        style: const TextStyle(
                          color: AppColors.justWhite,
                          fontSize: 12,
                        ),
                      )
                    : const SizedBox(),
                //Icon
                moreInfoOne != null && moreInfoOne is IconData
                    ? Icon(
                        moreInfoOne as IconData,
                        color: AppColors.justWhite,
                      )
                    : const SizedBox(),
                moreInfoTwo != null && moreInfoTwo is IconData
                    ? Icon(
                        moreInfoTwo as IconData,
                        color: AppColors.justWhite,
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
