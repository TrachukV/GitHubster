import 'package:dio/dio.dart';
import 'package:githubster/models/github_repository_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class GitHubApiRepository {
  final Dio _dio;

  static const int _maxOutput = 15;

  GitHubApiRepository(Dio dio) : _dio = dio {
    _dio.options = BaseOptions(
      baseUrl: 'https://api.github.com',
    );
    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
      ),
    );
  }

  Future<List<GitHubRepositoryModel>> fetchGitHubRepositories({
    required String searchValue,
  }) async {
    final response = await _dio.get(
      '/search/repositories',
      queryParameters: {
        'q': searchValue,
        'per_page': _maxOutput,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> repositoryList = response.data['items'];
      List<GitHubRepositoryModel> repositories = repositoryList
          .map((item) => GitHubRepositoryModel.fromJson(item))
          .toList();
      return repositories;
    } else {
      throw Exception('Failed to load repositories');
    }
  }
}
