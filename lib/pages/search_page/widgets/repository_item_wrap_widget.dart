import 'package:flutter/material.dart';
import 'package:githubster/resources/app_colors.dart';

class RepositoryItemWrapWidget extends StatelessWidget {
  const RepositoryItemWrapWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: AppColors.layer,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: child,
    );
  }
}
