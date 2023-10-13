import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:githubster/bloc/enums/initialize_status.dart';
import 'package:githubster/bloc/enums/request_status.dart';
import 'package:githubster/bloc/enums/search_history_status.dart';
import 'package:githubster/models/github_repository_model.dart';
import 'package:githubster/models/search_history_model.dart';
import 'package:githubster/repository/github_api_repository.dart';
import 'package:githubster/repository/local_storage_repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<InitializeEvent>(
      (event, emit) async => await _initialize(event, emit),
    );
    on<RequestForSearchEvent>(
      (event, emit) async => await _requestForSearch(event, emit),
    );
    on<AddToHistoryEvent>(
      (event, emit) => _addToHistory(event, emit),
    );
    on<AddToFavoriteEvent>(
      (event, emit) => _addToFavorite(event, emit),
    );
    on<RemoveFromFavoriteEvent>(
      (event, emit) => _removeFromFavorite(event, emit),
    );
    on<ShowHistoryEvent>(
      (event, emit) => _showHistory(event, emit),
    );
    on<RemoveFromHistoryEvent>(
      (event, emit) => _removeFromHistory(event, emit),
    );
  }

  late LocalStorageRepository _localStorageRepository;
  late GitHubApiRepository _gitHubSearchRepository;

  void _removeFromHistory(
    RemoveFromHistoryEvent event,
    Emitter<SearchState> emit,
  ) async {
    final List<SearchHistoryModel> githubHistoryList = [
      ...state.githubHistoryList,
    ];
    githubHistoryList.remove(event.searchHistoryModel);
    await _localStorageRepository.saveHistoryList(githubHistoryList);
    emit(
      state.copyWith(
        githubHistoryList: githubHistoryList,
      ),
    );
  }

  void _showHistory(
    ShowHistoryEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(
      state.copyWith(
        searchHistoryStatus: event.searchHistoryStatus,
      ),
    );
  }

  void _addToFavorite(
    AddToFavoriteEvent event,
    Emitter<SearchState> emit,
  ) async {
    final List<GitHubRepositoryModel> githubFavoriteList = [
      ...state.githubFavoriteList
    ];
    githubFavoriteList.add(event.gitHubRepositoryModel);
    await _localStorageRepository.saveFavoriteList(githubFavoriteList);
    emit(
      state.copyWith(githubFavoriteList: githubFavoriteList),
    );
  }

  void _removeFromFavorite(
    RemoveFromFavoriteEvent event,
    Emitter<SearchState> emit,
  ) async {
    final List<GitHubRepositoryModel> githubFavoriteList = [
      ...state.githubFavoriteList
    ];
    githubFavoriteList.remove(event.gitHubRepositoryModel);
    await _localStorageRepository.saveFavoriteList(githubFavoriteList);
    emit(
      state.copyWith(githubFavoriteList: githubFavoriteList),
    );
  }

  Future<void> _requestForSearch(
    RequestForSearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (event.searchValue.isNotEmpty) {
      emit(
        state.copyWith(
          requestStatus: RequestStatus.loading,
        ),
      );
      try {
        List<GitHubRepositoryModel> gitHubSearchList =
            await _gitHubSearchRepository.fetchGitHubRepositories(
          searchValue: event.searchValue,
        );
        emit(
          state.copyWith(
            githubSearchList: gitHubSearchList,
            requestStatus: RequestStatus.success,
            searchHistoryStatus: SearchHistoryStatus.search,
          ),
        );
      } on DioException catch (error) {
        log(error.message.toString());
        emit(
          state.copyWith(
            requestStatus: RequestStatus.error,
          ),
        );
      }
    }
  }

  void _addToHistory(
    AddToHistoryEvent event,
    Emitter<SearchState> emit,
  ) async {
    final List<SearchHistoryModel> githubHistoryList = [
      ...state.githubHistoryList
    ];
    githubHistoryList.add(
      SearchHistoryModel(searchValue: event.searchValue),
    );
    await _localStorageRepository.saveHistoryList(githubHistoryList);
    emit(
      state.copyWith(
        githubHistoryList: githubHistoryList,
      ),
    );
  }

  Future<void> _initialize(
    InitializeEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(
      state.copyWith(
        initializeStatus: InitializeStatus.loading,
      ),
    );
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _gitHubSearchRepository = GitHubApiRepository();
    _localStorageRepository = LocalStorageRepository(prefs);
    final List<GitHubRepositoryModel> githubFavoriteList =
        await _localStorageRepository.getFavoriteList();

    final List<SearchHistoryModel> githubHistoryList =
        await _localStorageRepository.getHistoryList();
    emit(
      state.copyWith(
        initializeStatus: InitializeStatus.success,
        githubHistoryList: githubHistoryList,
        githubFavoriteList: githubFavoriteList,
      ),
    );
  }
}
