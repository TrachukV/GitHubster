part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  final SearchHistoryStatus searchHistoryStatus;
  final InitializeStatus initializeStatus;
  final RequestStatus requestStatus;
  final List<GitHubRepositoryModel> githubFavoriteList;
  final List<SearchHistoryModel> githubHistoryList;
  final List<GitHubRepositoryModel> githubSearchList;

  const SearchState({
    this.searchHistoryStatus = SearchHistoryStatus.history,
    this.initializeStatus = InitializeStatus.initial,
    this.requestStatus = RequestStatus.initial,
    this.githubFavoriteList = const [],
    this.githubHistoryList = const [],
    this.githubSearchList = const [],
  });

  SearchState copyWith({
    SearchHistoryStatus? searchHistoryStatus,
    InitializeStatus? initializeStatus,
    RequestStatus? requestStatus,
    List<GitHubRepositoryModel>? githubFavoriteList,
    List<SearchHistoryModel>? githubHistoryList,
    List<GitHubRepositoryModel>? githubSearchList,
  }) {
    return SearchState(
      requestStatus: requestStatus ?? this.requestStatus,
      searchHistoryStatus: searchHistoryStatus ?? this.searchHistoryStatus,
      initializeStatus: initializeStatus ?? this.initializeStatus,
      githubFavoriteList: githubFavoriteList ?? this.githubFavoriteList,
      githubHistoryList: githubHistoryList ?? this.githubHistoryList,
      githubSearchList: githubSearchList ?? this.githubSearchList,
    );
  }

  @override
  List<Object?> get props => [
        searchHistoryStatus,
        initializeStatus,
        requestStatus,
        githubFavoriteList,
        githubHistoryList,
        githubSearchList,
      ];
}
