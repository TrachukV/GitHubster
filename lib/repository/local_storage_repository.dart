import 'dart:convert';

import 'package:githubster/models/github_repository_model.dart';
import 'package:githubster/models/search_history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepository {
  final SharedPreferences _prefs;

  LocalStorageRepository(this._prefs);

  static const String _historyListKey = 'historyListKey';
  static const String _favoriteListKey = 'favoriteListKey';

  Future<void> saveFavoriteList(
      List<GitHubRepositoryModel> githubFavoriteList) async {
    final String githubFavoriteListString = jsonEncode(githubFavoriteList);
    await _prefs.setString(_favoriteListKey, githubFavoriteListString);
  }

  Future<List<GitHubRepositoryModel>> getFavoriteList() async {
    final String? githubFavoriteListString = _prefs.getString(_favoriteListKey);
    if (githubFavoriteListString != null) {
      final List<GitHubRepositoryModel> githubFavoriteList =
          (jsonDecode(githubFavoriteListString) as List)
              .map(
                (item) => GitHubRepositoryModel.fromJson(item),
              )
              .toList();
      return githubFavoriteList;
    } else {
      return [];
    }
  }

  Future<void> saveHistoryList(
      List<SearchHistoryModel> githubHistoryList) async {
    final String githubHistoryListString = jsonEncode(githubHistoryList);
    await _prefs.setString(_historyListKey, githubHistoryListString);
  }

  Future<List<SearchHistoryModel>> getHistoryList() async {
    final String? githubHistoryListString = _prefs.getString(_historyListKey);
    if (githubHistoryListString != null) {
      final List<SearchHistoryModel> githubHistoryList =
          (jsonDecode(githubHistoryListString) as List)
              .map(
                (item) => SearchHistoryModel.fromJson(item),
              )
              .toList();
      return githubHistoryList;
    } else {
      return [];
    }
  }
}
