import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubster/bloc/enums/request_status.dart';
import 'package:githubster/bloc/search_bloc/search_bloc.dart';
import 'package:githubster/models/github_repository_model.dart';
import 'package:githubster/pages/search_page/widgets/repository_item_widget.dart';
import 'package:githubster/resources/app_colors.dart';
import 'package:githubster/resources/app_strings.dart';
import 'package:githubster/resources/app_styles.dart';

class RepositorySearchColumn extends StatelessWidget {
  const RepositorySearchColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        switch (state.requestStatus) {
          case RequestStatus.success:
            return state.githubSearchList.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.whatWeHaveFound,
                        style: AppStyles.header
                            .copyWith(color: AppColors.accentPrimary),
                      ),
                      const Spacer(),
                      Center(
                        child: Text(
                          AppStrings.nothingWasFound,
                          style: AppStyles.body2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.whatWeHaveFound,
                        style: AppStyles.header
                            .copyWith(color: AppColors.accentPrimary),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: state.githubSearchList.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 8.0,
                          ),
                          itemBuilder: (context, index) {
                            final GitHubRepositoryModel gitHubRepositoryModel =
                                state.githubSearchList[index];
                            return RepositoryItemWidget(
                              gitHubRepositoryModel: gitHubRepositoryModel,
                            );
                          },
                        ),
                      ),
                    ],
                  );
          case RequestStatus.loading:
            return const Align(
              alignment: Alignment.topCenter,
              child: CircularProgressIndicator.adaptive(
                backgroundColor: AppColors.textPlaceHolder,
              ),
            );
          case RequestStatus.initial:
            return const SizedBox.shrink();
          case RequestStatus.error:
            return const Icon(Icons.error);
        }
      },
    );
  }
}
