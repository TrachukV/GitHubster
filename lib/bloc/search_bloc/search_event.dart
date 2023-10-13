part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class InitializeEvent extends SearchEvent {}

class AddToHistoryEvent extends SearchEvent {
  final String searchValue;

  AddToHistoryEvent({
    required this.searchValue,
  });
}

class AddToFavoriteEvent extends SearchEvent {
  final GitHubRepositoryModel gitHubRepositoryModel;

  AddToFavoriteEvent({
    required this.gitHubRepositoryModel,
  });
}

class RemoveFromFavoriteEvent extends SearchEvent {
  final GitHubRepositoryModel gitHubRepositoryModel;

  RemoveFromFavoriteEvent({
    required this.gitHubRepositoryModel,
  });
}

class RequestForSearchEvent extends SearchEvent {
  final String searchValue;

  RequestForSearchEvent({
    required this.searchValue,
  });
}

class ShowHistoryEvent extends SearchEvent {
  final SearchHistoryStatus searchHistoryStatus;

  ShowHistoryEvent({
    required this.searchHistoryStatus,
  });
}

class RemoveFromHistoryEvent extends SearchEvent {
  final SearchHistoryModel searchHistoryModel;

  RemoveFromHistoryEvent({
    required this.searchHistoryModel,
  });
}
