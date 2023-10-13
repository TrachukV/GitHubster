import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubster/bloc/search_bloc/search_bloc.dart';
import 'package:githubster/gen/assets.gen.dart';
import 'package:githubster/models/github_repository_model.dart';
import 'package:githubster/pages/search_page/widgets/repository_item_widget.dart';
import 'package:githubster/pages/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:githubster/pages/widgets/custom_app_bar/custom_app_bar_button.dart';
import 'package:githubster/resources/app_strings.dart';
import 'package:githubster/resources/app_styles.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);
  static const routeName = 'favorites-page';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: AppStrings.favoriteReposList,
            leading: CustomAppBarButton(
              onTap: () {
                Navigator.pop(context);
              },
              iconAsset: Assets.icons.left.path,
            ),
          ),
          body: state.githubFavoriteList.isNotEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 24.0,
                  ),
                  itemCount: state.githubFavoriteList.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8.0,
                  ),
                  itemBuilder: (context, index) {
                    final GitHubRepositoryModel gitHubRepositoryModel =
                        state.githubFavoriteList[index];
                    return RepositoryItemWidget(
                      gitHubRepositoryModel: gitHubRepositoryModel,
                    );
                  },
                )
              : Column(
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Center(
                      child: Text(
                        AppStrings.noFavorites,
                        style: AppStyles.body2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                ),
        );
      },
    );
  }
}
