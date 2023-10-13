import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:githubster/resources/app_colors.dart';

class CustomAppBarButton extends StatelessWidget {
  const CustomAppBarButton({
    super.key,
    required this.onTap,
    required this.iconAsset,
  });

  final VoidCallback onTap;
  final String iconAsset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4.0,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            color: AppColors.accentPrimary,
          ),
          child: SvgPicture.asset(
            iconAsset,
            colorFilter: const ColorFilter.mode(
              AppColors.main,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
