import 'package:flutter/material.dart';
import 'package:githubster/resources/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.actions,
    required this.title,
    this.leading,
  });

  final List<Widget>? actions;
  final String title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      leadingWidth: 70.0,
      centerTitle: true,
      title: Text(title),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(3),
        child: Container(
          height: 3.0,
          decoration: const BoxDecoration(
            color: AppColors.layer,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10.0);
}
