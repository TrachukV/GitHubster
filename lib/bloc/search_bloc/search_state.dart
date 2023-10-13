part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  final SearchHistoryStatus searchHistoryStatus;
  final InitializeStatus initializeStatus;
  final RequestStatus requestStatus;
  final SearchFromHistoryStatus searchFromHistoryStatus;
  final List<GitHubRepositoryModel> githubFavoriteList;
  final List<SearchHistoryModel> githubHistoryList;
  final List<GitHubRepositoryModel> githubSearchList;
  final String searchFromHistoryValue;

  const SearchState({
    this.searchHistoryStatus = SearchHistoryStatus.history,
    this.initializeStatus = InitializeStatus.initial,
    this.requestStatus = RequestStatus.initial,
    this.searchFromHistoryStatus = SearchFromHistoryStatus.value,
    this.githubFavoriteList = const [],
    this.githubHistoryList = const [],
    this.githubSearchList = const [],
    this.searchFromHistoryValue = '',
  });

  SearchState copyWith({
    SearchHistoryStatus? searchHistoryStatus,
    InitializeStatus? initializeStatus,
    SearchFromHistoryStatus? searchFromHistoryStatus,
    RequestStatus? requestStatus,
    List<GitHubRepositoryModel>? githubFavoriteList,
    List<SearchHistoryModel>? githubHistoryList,
    List<GitHubRepositoryModel>? githubSearchList,
    String? searchFromHistoryValue,
  }) {
    return SearchState(
      requestStatus: requestStatus ?? this.requestStatus,
      searchHistoryStatus: searchHistoryStatus ?? this.searchHistoryStatus,
      initializeStatus: initializeStatus ?? this.initializeStatus,
      githubFavoriteList: githubFavoriteList ?? this.githubFavoriteList,
      githubHistoryList: githubHistoryList ?? this.githubHistoryList,
      githubSearchList: githubSearchList ?? this.githubSearchList,
      searchFromHistoryValue:
          searchFromHistoryValue ?? this.searchFromHistoryValue,
      searchFromHistoryStatus:
          searchFromHistoryStatus ?? this.searchFromHistoryStatus,
    );
  }

  @override
  List<Object?> get props => [
        searchHistoryStatus,
        searchFromHistoryValue,
        initializeStatus,
        requestStatus,
        githubFavoriteList,
        githubHistoryList,
        githubSearchList,
      ];
}
