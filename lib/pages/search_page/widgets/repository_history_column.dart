import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubster/bloc/enums/request_status.dart';
import 'package:githubster/bloc/search_bloc/search_bloc.dart';
import 'package:githubster/pages/search_page/widgets/repository_item_wrap_widget.dart';
import 'package:githubster/resources/app_colors.dart';
import 'package:githubster/resources/app_strings.dart';
import 'package:githubster/resources/app_styles.dart';

class RepositoryHistoryColumn extends StatelessWidget {
  const RepositoryHistoryColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.githubHistoryList.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.searchHistory,
                    style: AppStyles.header.copyWith(
                      color: AppColors.accentPrimary,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: state.requestStatus == RequestStatus.loading
                        ? const CircularProgressIndicator.adaptive(
                            backgroundColor: AppColors.textPlaceHolder,
                          )
                        : Text(
                            AppStrings.emptySearchHistory,
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
                    AppStrings.searchHistory,
                    style: AppStyles.header.copyWith(
                      color: AppColors.accentPrimary,
                    ),
                  ),
                  state.requestStatus == RequestStatus.loading
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: AppColors.textPlaceHolder,
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            itemCount: state.githubHistoryList.length,
                            padding: const EdgeInsets.symmetric(vertical: 24.0),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 8.0,
                            ),
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key: ValueKey<String>(
                                    state.githubHistoryList[index].searchValue),
                                onDismissed: (_) =>
                                    context.read<SearchBloc>().add(
                                          RemoveFromHistoryEvent(
                                            searchHistoryModel:
                                                state.githubHistoryList[index],
                                          ),
                                        ),
                                child: GestureDetector(
                                  onTap: () {
                                    context.read<SearchBloc>().add(
                                          RequestForSearchEvent(
                                            searchValue: state
                                                .githubHistoryList[index]
                                                .searchValue,
                                          ),
                                        );
                                  },
                                  child: RepositoryItemWrapWidget(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            state.githubHistoryList[index]
                                                .searchValue,
                                            style: AppStyles.body,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ],
              );
      },
    );
  }
}
