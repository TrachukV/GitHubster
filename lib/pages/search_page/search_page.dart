import 'package:flutter/material.dart';
import 'package:githubster/gen/assets.gen.dart';
import 'package:githubster/pages/favorite_page/favorite_page.dart';
import 'package:githubster/pages/search_page/widgets/search_body_page.dart';
import 'package:githubster/pages/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:githubster/pages/widgets/custom_app_bar/custom_app_bar_button.dart';
import 'package:githubster/resources/app_strings.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static const String routeName = 'search_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.githubReposList,
        actions: [
          CustomAppBarButton(
            onTap: () {
              Navigator.pushNamed(context, FavoritesPage.routeName);
            },
            iconAsset: Assets.icons.favoriteActive.path,
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: SearchBodyPage(),
      ),
    );
  }
}
