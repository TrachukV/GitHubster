import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubster/bloc/search_bloc/search_bloc.dart';
import 'package:githubster/gen/assets.gen.dart';
import 'package:githubster/models/github_repository_model.dart';
import 'package:githubster/resources/app_colors.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.gitHubRepositoryModel,
  });

  final GitHubRepositoryModel gitHubRepositoryModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final bool containsId =
            state.githubFavoriteList.contains(gitHubRepositoryModel);
        return GestureDetector(
          onTap: () {
            containsId
                ? context.read<SearchBloc>().add(
                      RemoveFromFavoriteEvent(
                        gitHubRepositoryModel: gitHubRepositoryModel,
                      ),
                    )
                : context.read<SearchBloc>().add(
                      AddToFavoriteEvent(
                        gitHubRepositoryModel: gitHubRepositoryModel,
                      ),
                    );
          },
          child: containsId
              ? Assets.icons.favoriteActive.svg(
                  colorFilter: const ColorFilter.mode(
                    AppColors.accentPrimary,
                    BlendMode.srcIn,
                  ),
                )
              : Assets.icons.favoriteActive.svg(),
        );
      },
    );
  }
}
