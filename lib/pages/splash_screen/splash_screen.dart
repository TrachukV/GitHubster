import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubster/bloc/enums/initialize_status.dart';
import 'package:githubster/bloc/search_bloc/search_bloc.dart';
import 'package:githubster/pages/search_page/search_page.dart';
import 'package:githubster/resources/app_colors.dart';
import 'package:githubster/resources/app_strings.dart';
import 'package:githubster/resources/app_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state.initializeStatus == InitializeStatus.success) {
          Navigator.pushNamedAndRemoveUntil(
              context, SearchPage.routeName, (route) => false);
        }
      },
      child: Material(
        color: AppColors.accentPrimary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.appName,
              style: AppStyles.header.copyWith(
                color: AppColors.layer,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.textPlaceHolder,
            ),
          ],
        ),
      ),
    );
  }
}
