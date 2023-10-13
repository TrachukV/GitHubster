import 'package:dio/dio.dart';
import 'package:githubster/repository/github_api_repository.dart';
import 'package:githubster/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DI {
  final Dio dio;
  final SharedPreferences prefs;

  late GitHubApiRepository gitHubSearchRepository;
  late LocalStorageRepository localStorageRepository;

  DI({
    required this.dio,
    required this.prefs,
  }) {
    gitHubSearchRepository = GitHubApiRepository(dio);
    localStorageRepository = LocalStorageRepository(prefs);
  }
}
