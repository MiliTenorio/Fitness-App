import 'package:fitness_app/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
  });
  final Color color;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.justWhite,
        ),
        onPressed: () {
          Modular.to.pop(context);
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppColors.justWhite,
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 130,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
